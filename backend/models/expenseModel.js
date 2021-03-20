import mongoose from 'mongoose';

const expenseSchema = new mongoose.Schema({
    expenseCost: {
        type: Number,
        required: true
    },
    expenseDetail: {
        type: String,
        required: true
    },
    expenseLocation: {
        type: String,
        required: true
    }
}, {
    timestamps: true,
})

module.exports = mongoose.model('Expense', expenseSchema)