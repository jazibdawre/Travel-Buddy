import { authenticate } from 'passport';
import express from 'express';
const router = express.Router();

// Auth Login
router.get('/login', (req, res) => {
  res.render('login', { user: req.user });
});

// Auth Logout
router.get('/logout', (req, res) => {
  // Handle with passport
  req.logout();
  res.redirect('/');
});

// Auth with Google
router.get(
  '/google',
  authenticate('google', {
    scope: ['profile'],
  })
);

// Callback route for Google to redirect to
router.get('/google/redirect', authenticate('google'), (req, res) => {
  res.redirect('/profile');
});

export default router;
