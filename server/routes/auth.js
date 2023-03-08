const express = require("express")
const User = require('../models/user.js')

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
    try{
        //get data from client -> req.body
        const {name, email , password} = req.body;

        //validation
        const existingUser = await User.findOne({email});
        if (existingUser) {
            return res.status(400).json({msg: "User already exists"})
        }

        let user = new User({
            email,
            password,
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

module.exports = authRouter;