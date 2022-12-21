const mongoose = require("mongoose");

const vehicleCategory = new mongoose.Schema({
    name:{
        type: String,
        require: true
    }
})


module.exports = mongoose.model('HealthCategory', vehicleCategory)