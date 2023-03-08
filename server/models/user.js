const mongoose = require("mongoose");

//create schema
const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true, //cleaning
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re  = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "please enter a valid email address"
        },
    },
    password: {
        required: true,
        type: String,
        //TODO: VALIDATE
    },
    address: {
        type: String,
        default: '',
    },
    type: {
       type: String,
       default: "user",
    }
    // cart
});
// need to change schema to module so as to export
const User = mongoose.model('User', userSchema);
module.exports = User;