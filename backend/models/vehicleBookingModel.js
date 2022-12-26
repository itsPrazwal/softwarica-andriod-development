const mongoose = require('mongoose');

const doctorAppointment = new mongoose.Schema({
    department : {
        type: String,
        require : true
    },
    startDate : {
        type : String,
        require : true
    },
    endDate : {
        type : String,
        require : true,
    },
    // time:{
    //     type: String,
    //     require : true
    // },
    fullname : {
        type : String,
        require : true
    },
    mobile : {
        type : String,
        require : true
    },
    email : {
        type : String
    },
    patientId : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'Patient'
    },
    vehicleId : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'Vehicle'
    },
    doctorId : {
        type : mongoose.Schema.Types.ObjectId,
        ref : "Doctor"
    },
    status :{
        type : String,
        require : true
    }
})

module.exports = mongoose.model("DoctorAppointment", doctorAppointment)