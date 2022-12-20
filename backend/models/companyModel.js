const mongoose = require('mongoose');

const company = new mongoose.Schema({
    fname : {
        type : String,
        require : true,
    },
    lname : {
        type : String,
        require : true
    },
    username : {
        type : String,
        require : true
    },
    email: {
        type : String,
        require : true
    },
    phone : {
        type : Number,
        require : true
    },
    address : {
        type : String
    },
    password : {
        type : String,
        require : true
    },
    picture : {
        type : String,
    }
})

module.exports = mongoose.model("Company", company)