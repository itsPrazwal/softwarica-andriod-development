const express = require('express');
const router = new express.Router();
const bcryptjs = require('bcryptjs');
const user = require("../models/userModel");
const jwt = require('jsonwebtoken');
const user_auth = require('../auth/auth');
const upload = require('../fileUpload/fileUpload');

router.post("/user/insert", (req,res) =>{
    const email = req.body.email;

    user.findOne({email : email})
    .then((email_details)=>{
        if(email_details!=null){
            return res.json({msg:"Already Email"});
        }
        const fname = req.body.fname;
        const lname = req.body.lname;
        const password = req.body.password;
        const username = req.body.username;
        const phone = req.body.phone;
        const age = req.body.age;
        const gender = req.body.gender;

        bcryptjs.hash(password,10, (e,hashed_pw)=>{
            const data = new user({
                fname : fname,
                lname :lname,
                email : email,
                password : hashed_pw,
                username : username,
                address : null,
                phone : phone,
                age : age,
                gender : gender,
                picture : null,
            })

            data.save()
            .then(()=>{
                res.json({msg : "Register Success", statusText : true})
            })
            .catch((e)=>{
                res.json({msg : "error", statusText : false})
            })
        })
    })
    .catch((e)=>{
        console.log(e)
    })
})


// Login for user
router.post('/user/login',(req,res)=>{
    const email = req.body.email;
    const password = req.body.password;

    user.findOne({email : email})
    .then((user_data)=>{
        if(user_data == null){
            console.log("dvsc");
            return res.json({msg : "Invalid Credentials"})
        }
        bcryptjs.compare(password,user_data.password,(e,result)=>{
            if(!result){
                return res.json({ msg : "Invalid Credentails"})
            }
            const token = jwt.sign({pID : user_data._id}, "B3AV3R69");
            res.json({token : token, msg : "Login Success"});
        })
    })
    .catch((e)=>{
        console.log(e)
    })
})

router.get('/user/dashboard/get',user_auth.user_guard, (req,res)=>{
    res.status(201).json({
        id : req.userINFO._id,
        fname : req.userINFO.fname,
        lname : req.userINFO.lname,
        email : req.userINFO.email,
        username : req.userINFO.username,
        age: req.userINFO.age,
        gender : req.userINFO.gender,
        phone : req.userINFO.phone,
        address : req.userINFO.address,
        password : req.userINFO.password,
        picture : req.userINFO.picture,
    })
})

router.put('/user/update/get', user_auth.user_guard, upload.single('pat_img'), (req,res)=>{
    const fname = req.body.fname;
    const lname = req.body.lname;
    const gender = req.body.gender;
    const age = req.body.age;
    const username = req.body.username;
    const phone = req.body.phone;
    const address = req.body.address;

    if(!req.file){
        user.updateOne(
            {_id : req.userINFO._id},
            {
                fname :fname,
                lname: lname,
                gender :gender,
                age:age,
                username : username,
                phone : phone,
                address : address
            }
        )
        .then(()=>{
            res.json({msg : "updated"})
        })
        .catch((e)=>{
            res.json({msg : "cannot update"})
        })
    } else{
        user.updateOne(
            {_id : req.userINFO._id},
            {
                fname :fname,
                lname: lname,
                gender :gender,
                age:age,
                username : username,
                phone : phone,
                address : address,
                picture : req.file.filename
            }
        )
        .then(()=>{
            res.json({msg : "updated img"})
        })
        .catch((e)=>{
            res.json({msg : "cannot update img"})
        })
    }
})

module.exports = router;