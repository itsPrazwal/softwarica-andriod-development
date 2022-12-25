const mongoose = require("mongoose");

const appointmentHDT = new mongoose.Schema({
    vehicleCategoryID :{
        type : mongoose.Schema.Types.ObjectId,
        ref : 'companyCategory',
    },
    date :{
        type: String,
        require : true,
    },
    time:{
        type: Array,
        require : true,
    }
})

module.exports = mongoose.model("AppointmentHDT", appointmentHDT)