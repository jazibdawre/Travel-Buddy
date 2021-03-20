import passport from 'passport';
import session from 'express-session';
import cookieParser from 'cookie-parser';
import express from 'express';
const router = express.Router();
router.get('/profile', isLoggedIn, function(req, res) {
    console.log(req.user)
    res.render('profile', {
        user : req.user 
    });
});

function isLoggedIn(req, res, next) {
	if (req.isAuthenticated())
		return next();
	res.redirect('/');
}

export default router;