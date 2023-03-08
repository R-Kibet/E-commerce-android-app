const express = require("express");
const authRouter = require('./routes/auth.js')
const mongoose = require("mongoose")

//Initialization
const app = express();
const PORT = 3000;
const DB =
"mongodb+srv://:@cluster0.sga2a48.mongodb.net/?retryWrites=true&w=majority"

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


app.listen(PORT, () => {
    console.log(`connected at port  ${PORT}`);
});