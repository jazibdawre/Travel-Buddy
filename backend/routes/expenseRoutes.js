const express = require('express');
const router = express.Router();
const Expense = require('../models/expenseModel')

router.get('/', async (req, res) => {    
    const expenses = await Expense.find({}, (err, items) => {
        if (err) {
            res.render('expense/show', { 
                expense: null,
                errorMessage: "Invalid expense"
            })
        } else {
            res.render('expense/show', {
                expense: items,
                errorMessage: null
            })
        }
    })
})

router.get('/new', (req, res) => {
    res.render('expense/new', {
        errorMessage: null
    })
})

router.post('/new', async (req, res) => {
    try{
        const expense = new Expense({
            expenseCost: req.body.expenseCost,
            expenseDetail: req.body.expenseDetail,
            expenseLocation: req.body.expenseLocation
        })
        const newExpense = await expense.save()
        res.redirect('expense/')
    } catch{
        const expense = await Expense.find({}, (err, items) => {
            if (err) {
                res.render('expense/new', {
                    errorMessage: "Invalid expense"
                })
            } else {
                res.redirect('/expense')
            }
        })
    }
})

module.exports = {
    router: router
}

