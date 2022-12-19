const express = require('express');
const router = new express.Router();
const auth = require("../auth/auth")
const healthCategory = require("../models/vehicleCategoryModel");
const appointmentHDT = require("../models/appointmentHDTModel");

router.get("/staff/vehicleCategory", async (req,res)=>{
    const healthCategoryList = await healthCategory.find({})
    if(!healthCategoryList){
        res.status(500).json({
            success : false,
        })
    } else{
        res.status(201).json({
            success: true,
            data: healthCategoryList,
        })
    }
})

// router for appointment date and time for a particular category
router.post("/staff/appointment/dateAndtime",auth.admin_guard, async(req,res)=>{
    const date = req.body.date;
    const time = req.body.time;
    const vehicleCategoryID = req.body.vehicleCategoryID;
    // console.log(vehicleCategoryID)
    appointmentHDT.findOne({vehicleCategoryID: vehicleCategoryID, date : date})
    .then((appointmentHDTDetails)=>{
        if(appointmentHDTDetails != null){
            console.log(appointmentHDTDetails)
            return res.json({msg: "Already DateAndTime"})
        }
        const data = new appointmentHDT({
            vehicleCategoryID : vehicleCategoryID,
            date: date,
            time : time,
        })

        data.save()
        .then(()=>{
            res.json({msg : "Added DateAndTime"})
        })
        .catch((e)=>{
            res.json({msg : "Cannot Add DateAndTime"})

        })
    })
    .catch((e)=>{
        res.json({msg : "Error"})
        console.log(e)
    })
})

router.get("/staff/appointment/dateAndtime/:vehicleCategoryID", async (req,res)=>{
    const vehicleCategoryID = req.params.vehicleCategoryID;
    const appointmentHDTList = await appointmentHDT.find({vehicleCategoryID: vehicleCategoryID})
    console.log(appointmentHDTList)
    if(!appointmentHDTList){
        res.status(500).json({
            success : false,
        })
    } else{
        res.status(201).json({
            success: true,
            data: appointmentHDTList,
        })
    }
})

router.put("/staff/appointment/time/delete", async(req,res)=>{
    const vehicleCategoryID = req.body.vehicleCategoryID;
    const date = req.body.date;
    const time = req.body.time;
    appointmentHDT.updateOne(
            {vehicleCategoryID : vehicleCategoryID,date : date},
            {$pull:{"time" : time}}
        )
    .then(()=>{
        res.send({msg:"time deleted"})
    })
    .catch((e)=>{
        res.send({msg:"time couldnot be deleted"})
        console.log(e);

    })
})

router.get("/staff/get/vehicleCategoryId/:name", async(req,res)=>{
    const name = req.params.name;
    const healthCategoryDetails = await healthCategory.findOne({name : name})
    console.log(healthCategoryDetails.data)
    if(!healthCategoryDetails){
        res.json({success : false})
    } else{
        res.json({
            success : true,
            data : healthCategoryDetails
        })
    }
})

router.put("/staff/appointment/time/add/:vehicleCategoryID", async(req,res)=>{
    const vehicleCategoryID = req.params.vehicleCategoryID;
    const date = req.body.date;
    const time = req.body.time;
    console.log(vehicleCategoryID);
    console.log(date);
    console.log(time);

    appointmentHDT.findOne({vehicleCategoryID : vehicleCategoryID,date : date,time: time})
    .then((appointment_HDT)=>{
        if(appointment_HDT == null){
            appointmentHDT.updateOne(
                    {vehicleCategoryID : vehicleCategoryID,date : date},
                    {$push:{"time" : time}}
                )
            .then(()=>{
                res.json({success:true ,msg:"time added"})
            })
            .catch((e)=>{
                res.json({msg:"time couldnot be added"})
                console.log("Error");
                console.log(e);

            })
        } else{
            res.json({success: false,msg:"already same time on same date and category"})
        }
    })
    .catch((e)=>{
        res.json({success: false,msg:"couldnot find data"})

    })

})

module.exports = router;


