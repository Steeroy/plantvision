import jwt from 'jsonwebtoken';

export const generateToken = (user) => {
  return jwt.sign(
    {
      _id: user._id,
      name: user.name,
      email: user.email,
      role: user.role,
    },
    process.env.JWT_SEC,
    {
      expiresIn: '7d',
    }
  );
};

export const isAuth = (req, res, next) => {
  const authorization = req.headers.authorization;

  if (authorization) {
    const token = authorization.slice(7, authorization.length);

    jwt.verify(token, process.env.JWT_SEC, (err, decode) => {
      if (err) {
        res.status(400).json({ message: 'Invalid Token' });
      } else {
        req.user = decode;
        next();
      }
    });
  } else {
    res.status(400).json({ message: 'No Token' });
  }
};
