const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const googleSchema = new Schema({
    username: String,
    googleId: String,
    thumbnail: String
})

export const Googler = mongoose.model('googler', googleSchema);
// module.exports = Googler;