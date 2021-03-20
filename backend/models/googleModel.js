const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const googleSchema = new Schema({
    username: String,
    googleId: String,
    thumbnail: String
})

const Googler = mongoose.model('googler', googleSchema);
module.exports = Googler;