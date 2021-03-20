const mongoose = require("mongoose");
const Schema = mongoose.Schema;

var facebookSchema = new Schema({
    uid: String,
    token: String,
    email: String,
    name: String,
    gender: String,
    pic: String
});

export const Facebook = mongoose.model('facebook', facebookSchema);