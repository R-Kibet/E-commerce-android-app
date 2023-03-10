const express = require("express")
const User = require('../models/user.js')
const jwt = require("jsonwebtoken")

const {hashPassword, comparePassword} = require("../utils/encrypt.js")
const auth = require("../middleware/auth_mid.js")

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

authRouter.post("/tokenIsValid", async (req, res) => {
    try{
        const token = req.header("x-auth-token");

        if(!token) return res.json(false);

        const verify = jwt.verify(token, 'passwordKey');

        if(!verify) return res.json(false);

        const user = await User.findById(verify.id);
        if (!user) return res.json(false);
        res.json(true);

    } catch (e) {
        res.status(500).json({error: e.message})
    }
})

//get user data middleware
authRouter.get("/", auth, async (req, res) => {
    const user = await User.findOne(req.user);
    res.json({ ...user._doc, token: req.token});
})


module.exports = authRouter;