const express = require('express');
const router = new express.Router();
const appointment = require("../models/appointmentModel");
const vehicleBooking = require("../models/vehicleBookingModel");
const auth = require("../auth/auth");

// route to book appointment
router.post("/user/bookAppointment/get",auth.patient_guard, async(req,res)=>{
    console.log(req.patientINFO);
    const category = req.body.category;
    const date = req.body.date;
    const time = req.body.time;
    const visitPurpose = req.body.visitPurpose;
    const appointmentFor = req.body.appointmentFor;
    const fullname = req.body.fullname;
    const mobile = req.body.mobile;
    const email = req.body.email;
    const patientId = req.patientINFO._id;

    const appointmentDetails = await appointment.findOne({patientId: req.patientINFO._id,category: category,date:date,time:time});
    if(appointmentDetails == null){
        const data = new appointment({
            category : category,
            date : date,
            time: time,
            visitPurpose : visitPurpose,
            appointmentFor : appointmentFor,
            fullname : fullname,
            mobile : mobile,
            email : email,
            patientId : patientId,
        })

        data.save()
        .then(()=>{
            res.json({msg : "Appointment Booked"})
        })
        .catch((e)=>{
            res.json({msg : "Booking failed"})
        })
    } else{
        res.json({msg: "Already Appointment"})
    }
})

router.get("/user/getBookedAppointment/get",auth.patient_guard, async (req,res)=>{
    console.log(req.patientINFO)
    const appointmentDetails = await appointment.find({patientId: req.patientINFO._id});
    if(!appointmentDetails){
        res.status(500).json({success : false})
    } else{
        res.status(201).json({
            success : true,
            data : appointmentDetails
        })
    }
})

router.get("/user/getSingleAppointment/:appointmentId", async(req,res)=>{
    const appointmentId = req.params.appointmentId;
    const appointmentDetails = await appointment.findOne({_id : appointmentId})
    if(!appointmentDetails){
        res.status(500).json({success : false})
    } else{
        res.status(201).json({
            success : true,
            data : appointmentDetails
        })
    }
})

router.put("/user/updateBookedAppointment/get/:appointmentId", auth.patient_guard, async(req,res)=>{

    const fullname = req.body.fullname;
    const mobile = req.body.mobile;
    const email = req.body.email;
    const appointmentFor = req.body.appointmentFor;

    appointment.updateOne(
            {_id : req.params.appointmentId},
            {
                appointmentFor : appointmentFor,
                fullname : fullname,
                mobile : mobile,
                email : email,
            }
        )
        .then(()=>{
            res.json({msg : "Updated"})
        })
        .catch((e)=>{
            res.json({msg : "Cannot Update"})
        })
})

router.delete("/user/deleteBookedAppointment/get/:appointmentId", auth.patient_guard,(req,res)=>{
    const appointmentId = req.params.appointmentId;
    appointment.deleteOne({_id : appointmentId })
    .then(()=>{
        res.send({msg: "Appointment Deleted", success: true})
    })
    .catch((e)=>{
        res.send({msg: "Cannot Delete Appointment",success: false})
    })
})



// ########################################## for booking doctor appointment $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

router.post("/user/bookVehicleAppointment/get", auth.patient_guard, async (req,res)=>{
    const startDate = req.body.startDate;
    const endDate = req.body.endDate;
    // const time = req.body.time;
    const doctorId = "63be707249b3ea1a5918af67";
    const vehicleId = req.body.vehicleId;
    const patientId = req.patientINFO._id;
    const department = req.body.department;
    const fullname = req.body.fullname;
    const mobile = req.body.mobile;
    const email = req.body.email;
    console.log(vehicleId);

    const doctorAppointmentDetails = await vehicleBooking.findOne({patientId : patientId, vehicleId : vehicleId, startDate : startDate, endDate : endDate})
    if(doctorAppointmentDetails == null){
        const data = new vehicleBooking({
            vehicleId : vehicleId,
            startDate : startDate,
            endDate : endDate,
            doctorId : doctorId,
            patientId : patientId,
            department : department,
            fullname : fullname,
            mobile : mobile,
            email : email,
            status : "Pending"
        })

        data.save()
        .then(()=>{
            res.json({msg : "Doctor Appointment Booked"})
        })
        .catch((e)=>{
            console.log("Error"  + e)
            res.json({msg : "Doctor Booking failed"})
        })
    } else{
        console.log("Error3")
        res.json({msg : "Already Appointment"})
    }
})


router.get("/user/getBookedVehicleAppointment/get", auth.patient_guard, async(req,res)=>{
    const doctorBookedAppointment = await vehicleBooking.find({patientId : req.patientINFO._id}).populate("vehicleId").populate("doctorId")
    if(!doctorBookedAppointment){
        res.status(500).json({success : false, msg : "Error no booked appointment"})
    } else{
        res.status(200).json({success: true , data : doctorBookedAppointment})
    }
})

router.put("/user/updateBookedVehicleAppointment/get/:appointmentId", auth.patient_guard, async(req,res)=>{

    const fullname = req.body.fullname;
    const mobile = req.body.mobile;
    const email = req.body.email;
    const startDate = req.body.startDate;
    const endDate = req.body.endDate;

    vehicleBooking.updateOne(
            {_id : req.params.appointmentId},
            {
                fullname : fullname,
                mobile : mobile,
                email : email,
                startDate : startDate,
                endDate : endDate
            }
        )
        .then(()=>{
            res.json({msg : "Updated"})
        })
        .catch((e)=>{
            res.json({msg : "Cannot Update"})
        })
})

router.delete("/user/deleteBookedVehicleAppointment/get/:appointmentId", auth.patient_guard,(req,res)=>{
    console.log(req.params.appointmentId)
    vehicleBooking.deleteOne({_id : req.params.appointmentId })
    .then(()=>{
        res.send({msg: "Doctor Appointment Deleted", success: true})
    })
    .catch((e)=>{
        res.send({msg: "Cannot Delete Doctor Appointment",success: false})
    })
})


module.exports = router;