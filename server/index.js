const express = require("express");
const authRouter = require('./routes/auth.js')
const mongoose = require("mongoose")
const DB = require("./env.js")

//Initialization
const app = express();
const PORT = 3000;


//middleware
app.use(express.json())
app.use(authRouter);

//connection
mongoose.connect(DB).then( () => {
    console.log("Connection successful")
})
.catch((e) => {
    console.log(e)
})


app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port  ${PORT}`);
});