const express = require("express");
const app = express();
const authRouter = express.Router();
const User = require("../models/user");
const mongoose= require("mongoose");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
// auth = require("/middleware/auth.js");
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
        const token = jwt.sign({ userId: user._id }, 'secretkey');
        res.status(200).json({ token, ...user._doc});
        
        console.log("signed in successfully");
        
    }
    
  

catch (error) {
    console.log(error);
    res.status(500).json({ error: "something went wrong" });
}
});
authRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const user = await User.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  
  // get user data
  authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });
  
  module.exports = authRouter;

