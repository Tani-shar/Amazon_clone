const express = require("express");
const app = express();
const authRouter = express.Router();
const User = require("../models/user");
const mongoose= require("mongoose");
const jwt = require("jsonwebtoken");

authRouter.post('/api/signup', async (req, res)=> {

    //get the data from client
    const {name,email,password} = req.body;
    // console.log(req.body);

    const exisitingUser=await User.findOne({email: email})
    if(exisitingUser){
        return res.status(422).json({error:"user already exist"});

    }

    let user = new User({
        name,
        email,
        password,
    })
    user = await user.save();
    res.json(user);
    // post that data in database
    
    //return that data to the user
})
authRouter.post('/api/signin', async (req, res)=> {
try {
    
        const {email, password} = req.body;
        const user = await User.findOne({email});
        if (!user) {
            return res.status(422).json({ error: "invalid email" });
        }
        
        if (password !==user.password) {
            return res.status(422).json({ error: "invalid password" });
        }
        const token = jwt.sign({ userId: user._id }, 'secretkey', { expiresIn: '1h' });
        res.status(200).json({ token, ...user._doc});
        
        console.log("signed in successfully");
        
    }
    
  

catch (error) {
    console.log(error);
    res.status(500).json({ error: "something went wrong" });
}
});



module.exports = authRouter; 