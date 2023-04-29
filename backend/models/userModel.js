import mongoose from 'mongoose';

const userSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      trim: true,
      minlength: 3,
      maxlength: 50,
    },
    email: {
      type: String,
      required: true,
      trim: true,
      unique: true,
      lowercase: true,
      minlength: 3,
      maxlength: 50,
      validate: {
        validator: (value) => {
          const re =
            /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
          return value.match(re);
        },
        message: 'Please enter a valid email address.',
      },
    },
    password: {
      type: String,
      required: true,
    },
    role: { type: String, enum: ['user', 'admin'], default: 'user' },
  },
  {
    timestamps: true,
  }
);

const User = mongoose.model('User', userSchema);
export default User;
