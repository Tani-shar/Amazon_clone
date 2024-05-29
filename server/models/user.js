const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        trim: true,
        validate:{
            validator: function(value){
                return /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(value);
            },
            message: props => `${props.value} is not a valid email`
        }
    },
    password: {
        type: String,
        required: true
    },
    address:{
        type: String,
        default: '',
    },
    type: {
        type: String,
        default : 'user',
    }
})

const User = mongoose.model('User', userSchema);

module.exports = User;