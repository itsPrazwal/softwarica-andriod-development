const mongoose = require('mongoose');

const vehicle = new mongoose.Schema({
    name : {
        type : String,
        require : true,
    },
    department : {
        type : String,
        require : true
    },
    picture : {
        type : String,
    }
})

module.exports = mongoose.model("Vehicle", vehicle)