const express = require("express")
const User = require('../models/user.js')
const {hashPassword, comparePassword} = require("../utils/encrypt.js")
const jwt = require("jsonwebtoken")

const authRouter = express.Router();

//SIGN UP ROUTE
authRouter.post("/api/signup", async (req, res) => {
    try{
        //get data from client -> req.body
        const {name, email , password} = req.body;

        //validation
        const existingUser = await User.findOne({email});
        if (existingUser) {
            return res.status(400).json({msg: "User already exists"})
        }

        const pass = hashPassword(req.body.password);

        let user = new User({
            email,
            password: pass,
            name,
        })

        user = await user.save();
        res.json(user)
   } catch (e) {
    res.status(500).json({error: e.message })
   }
    // post data in database

    // return data to user
})

//SIGN IN ROUTE
authRouter.post("/api/signin", async (req, res) => {
    try {

        const {email, password} = req.body;

        const user = await User.findOne({email})
        if (!user){
            return res.status(400).json({msg: "user doesn't exist"})
        }

        const pass = comparePassword(password, user.password);
        if (!pass){
           return res.status(400).json({msg: "wrong credentials"})
        }

        const token = jwt.sign({id: user._id},"passwordKey")
        res.json({token, ...user._doc})


    }catch (e) {
        res.status(500).json({error: e.message})
    }
})


module.exports = authRouter;