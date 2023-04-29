import express from 'express';
import expressAsyncHandler from 'express-async-handler';
import User from '../models/userModel.js';
import bcrypt from 'bcryptjs';
import { generateToken, isAuth } from '../utils.js';

const userRouter = express.Router();

userRouter.post(
  '/signin',
  expressAsyncHandler(async (req, res) => {
    const user = await User.findOne({ email: req.body.email });

    if (user) {
      if (bcrypt.compareSync(req.body.password, user.password)) {
        return res.status(200).json({
          _id: user._id,
          name: user.name,
          email: user.email,
          role: user.role,
          token: generateToken(user),
        });
      }
    }
    res.status(400).json({ message: 'Invalid email or password' });
  })
);

userRouter.post(
  '/signup',
  expressAsyncHandler(async (req, res) => {
    try {
      const existUser = await User.findOne({ email: req.body.email });

      if (existUser) {
        res
          .status(400)
          .json({ message: 'User with the same email already exists. Login' });
        return;
      }

      const newUser = new User({
        name: req.body.name,
        email: req.body.email,
        password: bcrypt.hashSync(req.body.password),
      });

      const user = await newUser.save();
      res.status(201).json({
        _id: user._id,
        name: user.name,
        email: user.email,
        role: user.role,
        token: generateToken(user),
      });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  })
);

userRouter.post(
  '/token',
  isAuth,
  expressAsyncHandler(async (req, res) => {
    try {
      const user = await User.findById(req.user._id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  })
);

userRouter.get(
  '/',
  isAuth,
  expressAsyncHandler(async (req, res) => {
    try {
      const user = await User.findById(req.user._id);
      res.status(201).json({
        _id: user._id,
        name: user.name,
        role: user.role,
        token: user.token,
      });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  })
);

export default userRouter;
