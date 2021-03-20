const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20');
const keys = require('./keys');
const Googler = require('../models/googleModel');

passport.serializeUser((googler, done) => {
    done(null, googler.id);
});

passport.deserializeUser((id, done) => {
    Googler.findById(id).then((googler) => {
        done(null, googler);
    })
});


passport.use(
    new GoogleStrategy({
        // Options for the Google Strategy
        callbackURL: '/auth/google/redirect',
        clientID: keys.google.clientID,
        clientSecret: keys.google.clientSecret
    }, (accessToken, refreshToken, profile, done) => {
        // Passport Callback Function
        // Check if Googler already exists in our database
        Googler.findOne({googleId: profile.id}).then((currentGoogler) => {
            if(currentGoogler){
                // Already created
                // console.log("Googler is ", currentGoogler);
                done(null, currentGoogler);
            } else{
                // If not create a new Googler
                new Googler({
                    username: profile.displayName,
                    googleId: profile.id
                }).save().then((newGoogler) => {
                    // console.log('New Googler created ' + newGoogler)
                });
                done(null, newGoogler);
            }
        })
    })
)
