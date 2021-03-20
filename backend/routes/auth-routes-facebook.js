import passport from 'passport';
import session from 'express-session';
import cookieParser from 'cookie-parser';
import express from 'express';
import facebookStrategy from 'passport-facebook';
const router = express.Router();

router.get('/auth/facebook', passport.authenticate('facebook', { scope : 'email' }));

router.get('/facebook/callback',
	passport.authenticate('facebook', {
		successRedirect : '/profile',
		failureRedirect : '/'
	})
);

router.get('/',(req,res) => {
    res.render("index")
})

router.get('/logout', function(req, res) {
    req.logout();
    res.redirect('/');
});


export default router;