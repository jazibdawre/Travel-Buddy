import path from 'path';
import express from 'express';
import dotenv from 'dotenv';
import colors from 'colors';
import morgan from 'morgan';
import Redis from 'ioredis';
import cors from 'cors';
import cookieSession from 'cookie-session';
import cookieParser from 'cookie-parser';
import session  from 'express-session';
import facebookStrategy  from 'passport-facebook'
import { notFound, errorHandler } from './middleware/errorMiddleware.js';
import paymentRouter from './routes/paymentRouter.js';
import { verify } from './middleware/authMiddleware.js';
import connectDB from './config/db.js';

import { graphqlHTTP } from 'express-graphql';

import graphqlSchema from './graphql/schemas/index.js';
import graphqlResolvers from './graphql/resolvers/index.js';

import authRoutes from './routes/auth-routes.js';  //
import profileRoutes from './routes/profile-routes.js';  //
import keys from './config/keys.js';
import passport from 'passport'
import facebookauthRoutes from './routes/auth-routes-facebook.js'; //
import facebookprofileRoutes from './routes/profile-routes-facebook.js'; //

dotenv.config();
await connectDB();

const app = express();
const redis = new Redis();

if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

app.use(express.json());
app.use(cors({ credentials: true }));
app.use(verify);
app.use(cors());

app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept'
  );
  next();
});

app.use(paymentRouter);

app.use(
  '/graphql',
  graphqlHTTP((req, res, graphQLParams) => {
    return {
      schema: graphqlSchema,
      rootValue: graphqlResolvers,
      context: { req, redis },
      graphiql: process.env.NODE_ENV === 'development' ? true : false,
    };
  })
);

const __dirname = path.resolve();
app.use('/uploads', express.static(path.join(__dirname, '/uploads')));

if (process.env.NODE_ENV === 'production') {
  app.use(express.static(path.join(__dirname, '/frontend/build')));

  app.get('*', (req, res) =>
    res.sendFile(path.resolve(__dirname, 'frontend', 'build', 'index.html'))
  );
} else {
  app.get('/', (req, res) => {
    res.send('API is running....');
  });
}

app.use(notFound);
app.use(errorHandler);

// Google OAuth Start

app.use(
  cookieSession({
    maxAge: 24 * 60 * 60 * 1000,
    keys: [keys.session.cookieKey],
  })
);

//Initialize passport
app.use(passport.initialize());
app.use(passport.session());
app.use('/auth', authRoutes);
app.use('/profile', profileRoutes);


// Google OAuth end

// Facebook OAuth Start

app.use(session({ 
  secret: 'ilovescotchscotchyscotchscotch',    
  resave: true,
  saveUninitialized: true 
}));
app.use(cookieParser());
app.use(passport.initialize());

app.use('/facebookauth', authRoutes);
app.use('/facebookprofile', profileRoutes);

// Facebook OAuth End

const PORT = process.env.PORT || 5000;

export const server = app.listen(
  PORT,
  console.log(
    `Server running in ${process.env.NODE_ENV} mode on port ${PORT}`.yellow.bold
  )
);

export default {
  app,
};
