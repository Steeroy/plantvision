import express from 'express';
import mongoose from 'mongoose';
import dotenv from 'dotenv';
import userRouter from './routes/userRoutes.js';

const app = express();
app.use(express.json());
dotenv.config();

const PORT = process.env.PORT || 3500;

mongoose
  .connect(process.env.MONGODB_URI)
  .then(() => {
    console.log('Connected to database');
  })
  .catch((err) => {
    console.log(err.message);
  });

app.use('/api/users', userRouter);

app.listen(PORT, () =>
  console.log(`Server running on port http://localhost:${PORT}`)
);
