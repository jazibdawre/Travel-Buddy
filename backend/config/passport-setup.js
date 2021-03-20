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

passport.use(new facebookStrategy({
    clientID        : keys.facebook.clientID,
    clientSecret    : keys.google.clientSecret,
    callbackURL     : "http://localhost:5000/facebook/callback",
    profileFields: ['id', 'displayName', 'name', 'gender', 'picture.type(large)','email']

},

function(token, refreshToken, profile, done) {
    process.nextTick(function() {
        User.findOne({ 'uid' : profile.id }, function(err, user) {
            if (err)
                return done(err);
            if (user) {
                console.log("user found")
                console.log(user)
                return done(null, user); // user found, return that user
            } else {
                var newUser = new User();
                newUser.uid    = profile.id; // set the users facebook id                   
                newUser.token = token; // we will save the token that facebook provides to the user                    
                newUser.name  = profile.name.givenName + ' ' + profile.name.familyName; // look at the passport user profile to see how names are returned
                newUser.email = profile.emails[0].value; // facebook can return multiple emails so we'll take the first
                newUser.gender = profile.gender
                newUser.pic = profile.photos[0].value
                // save our user to the database
                newUser.save(function(err) {
                    if (err)
                        throw err;
                    return done(null, newUser);
                });
            }

        });

    })

}));

passport.serializeUser(function(user, done) {
    done(null, user.id);
});

passport.deserializeUser(function(id, done) {
    User.findById(id, function(err, user) {
        done(err, user);
    });
});