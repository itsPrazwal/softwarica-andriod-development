const jwt = require('jsonwebtoken');
const user = require('../models/userModel');
const doctor = require("../models/companyModel");
const staff = require("../models/staffModel");
const admin = require("../models/adminModel");

module.exports.user_guard= (req,res,next) => {
    try{
        const token = req.headers.authorization.split(' ')[1];
        const data = jwt.verify(token, "B3AV3R69");
        user.findOne({_id : data.pID})
        .then((p_data)=>{
            req.userINFO = p_data;
            next();
        })
        .catch((e) =>{
            res.json({msg : "Invalid Token"})
        })

    }
    catch(e){
        res.json({msg : "Invalid Token"})
    }
}

module.exports.company_guard= (req,res,next) => {
    try{
        const token = req.headers.authorization.split(' ')[1];
        const data = jwt.verify(token, "B3AV3R69");
        doctor.findOne({_id : data.dID})
        .then((d_data)=>{
            req.companyINFO = d_data;
            next();
        })
        .catch((e) =>{
            res.json({msg : "Invalid Token"})
        })

    }
    catch(e){
        res.json({msg : "Invalid Token"})
    }
}

module.exports.admin_guard= (req,res,next) => {
    try{
        const token = req.headers.authorization.split(' ')[1];
        // console.log(token)
        const data = jwt.verify(token, "B3AV3R69");
        // console.log(data)
        admin.findOne({_id : data.aID})
        .then((a_data)=>{
            req.adminINFO = a_data;
            next();
        })
        .catch((e) =>{
            res.json({msg : "Invalid Token"})
        })

    }
    catch(e){
        res.json({msg : "Invalid Token eee"})
    }
}

// this is guard for staff

module.exports.staff_guard = (req,res,next) =>{
    try{
        const token = req.headers.authorization.split(" ")[1];
        const data = jwt.verify(token, "B3AV3R69");
        staff.findOne({_id: data.sID})
        .then(()=>{})
        .catch(()=>{})

    }
    catch(e){}
}