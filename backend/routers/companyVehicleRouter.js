const express = require('express');
const router = new express.Router();
const bcryptjs = require('bcryptjs');
const auth = require('../auth/auth');
const upload = require('../fileUpload/fileUpload');
const jwt = require('jsonwebtoken');
const company = require('../models/companyModel');
const vehicle = require('../models/vehicleModel');
const vehicleBooking = require("../models/vehicleBookingModel");

router.post('/vehicle/register',auth.admin_guard, upload.single('doc_img'),(req,res)=>{
    const name = req.body.name;

    vehicle.findOne({name : name})
    .then((name_details)=>{
        if(name_details!=null){
            return res.json({msg:"Already Name"});
        }
        const department = req.body.department;
        const picture = req.file.filename;
        const data = new vehicle({
            name : name,
            department : department,
            picture : picture
        })

        data.save()
        .then(()=>{
            res.json({msg : "registered vehicle"})
        })
        .catch((e)=>{
            res.json({msg : "error"})
        })


    })
    .catch((e)=>{
        res.json({msg: "error 123" })
    })
})

router.get("/vehicle/category/:department", async(req,res)=>{
    const vehicle_details = await vehicle.find({department : req.params.department})
    res.json({
        details : vehicle_details
    })
})

router.post('/company/register',auth.admin_guard, upload.single('doc_img'),(req,res)=>{
    const email = req.body.email;

    company.findOne({email : email})
    .then((email_details)=>{
        if(email_details!=null){
            return res.json({msg:"Already Email"});
        }
        const fname = req.body.fname;
        const lname = req.body.lname;
        const password = req.body.password;
        const username = req.body.username;
        const address = req.body.address;
        const phone = req.body.phone;
        const department = req.body.department;
        const picture = req.file.filename;

        bcryptjs.hash(password,10, (e,hashed_pw)=>{
            const data = new company({
                fname : fname,
                lname :lname,
                email : email,
                password : hashed_pw,
                username : username,
                address : address,
                phone : phone,
                department : department,
                picture : picture
            })

            data.save()
            .then(()=>{
                res.json({msg : "registered"})
            })
            .catch((e)=>{
                res.json({msg : "error"})
            })
        })
    })
    .catch(()=>{

    })
})


// Login for company
router.post('/company/login',(req,res)=>{
    const email = req.body.email;
    const password = req.body.password;

    company.findOne({email : email})
    .then((company_data)=>{
        if(company_data == null){
            return res.json({msg : "Invalid Credentials"})
        }
        bcryptjs.compare(password,company_data.password,(e,result)=>{
            if(result == false){
                return res.json({ msg : "Invalid Credentails"})
            }
            const token = jwt.sign({dID : company_data._id}, "B3AV3R69");
            res.json({token : token,msg : "Login Success"});
        })
    })
    .catch((e)=>{

    })

})


router.get("/company/get/:company_id", async (req,res)=>{
    const company_detail = await company.findOne({_id : req.params.company_id})
    if(!company_detail){
        res.json({msg : "Error in retrieving doc"})
    } else{
        res.json({data : company_detail})
    }
})


router.get('/company/dashboard/single',auth.company_guard ,(req,res)=>{
    res.json({
        id : req.companyINFO._id,
        fname : req.companyINFO.fname,
        lname : req.companyINFO.lname,
        gender : req.companyINFO.gender,
        age : req.companyINFO.age,
        email : req.companyINFO.email,
        username : req.companyINFO.username,
        phone: req.companyINFO.phone,
        address : req.companyINFO.address,
        department : req.companyINFO.department,
        picture : req.companyINFO.picture
    })
})


router.get('/company/dashboard/get/admin', auth.admin_guard, async (req,res)=>{
    console.log("Errororororr")
    const company_detail = await company.find({})
    res.json({
        details: company_detail
    })
})


router.get("/company/category/:department", async(req,res)=>{
    const company_detail = await company.find({department : req.params.department})
    res.json({
        details : company_detail
    })
})

router.get("/company/getAppointment/:status", auth.company_guard, async(req,res)=>{
    const appointmentDetails = await vehicleBooking.find({doctorId : req.companyINFO._id, status : req.params.status}).populate("patientId").populate("vehicleId")
    if(!appointmentDetails){
        res.json({success : false,msg : "Appointment Not Found"})
    } else{
        res.json({success : true, data : appointmentDetails})
    }
})

router.put("/company/updateAppointmentStatus/:appointmentId", auth.company_guard, async(req,res)=>{

    vehicleBooking.updateOne(
            {_id : req.params.appointmentId},
            {
                status : req.body.appointmentStatus
            }
        )
        .then(()=>{
            res.json({msg : "Updated Status"})
        })
        .catch((e)=>{
            res.json({msg : "Cannot Update"})
            console.log(e)
        })
})


module.exports = router