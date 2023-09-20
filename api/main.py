# imports
from fastapi import FastAPI, File, UploadFile
import uvicorn
import numpy as np
from io import BytesIO
from PIL import Image
import tensorflow as tf
import matplotlib.pyplot as plt

app = FastAPI()

MODEL = tf.keras.models.load_model("../saved_models/1")
CLASS_NAMES = ['fresh', 'rotten']


# Functions
def read_file_as_image(data) -> np.ndarray:
    image = Image.open(BytesIO(data))

    if image.mode != 'RGB':
        image = image.convert('RGB')

    image = image.resize((96, 96), Image.LANCZOS)
    image = np.array(image)
    return image


# Endpoints
@app.get("/ping")
async def ping():
    return "hello, from the other side"


@app.post("/predict")
async def predict(
        file: UploadFile = File(...)
):
    image = read_file_as_image(await file.read())
    img_batch = np.expand_dims(image, 0)
    prediction = MODEL.predict(img_batch)
    predicted = 1 if prediction[0][0] >= 0.5 else 0
    return {
        'class': CLASS_NAMES[predicted]
    }


if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8000)
