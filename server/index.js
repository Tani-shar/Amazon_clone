const express = require("express");
const mongoose = require("mongoose");
const PORT = 3000;
const app = express();
const authRouter = require('./routes/auth')
app.use(express.json());
app.use(authRouter);

//connection 
mongoose.connect("mongodb+srv://tanishqsharma201:test123@cluster0.bosjzcv.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0").then(()=> {
    console.log("connection successful");
})
.catch((e)=>{
    console.log(e);
})
app.listen(PORT, '0.0.0.0' ,() => {
  console.log(`connected at port ${PORT}`);
});
