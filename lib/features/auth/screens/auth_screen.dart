// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:amazon_clone_tutorial/common/widgets/custom_button.dart';
import 'package:amazon_clone_tutorial/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup,
}
class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}):super(key:key);
  
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signInFormkey= GlobalKey<FormState>();
  final _signUpFormkey= GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController1 = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();
  @override

  void dispose() {
  
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailController1.dispose();
    _passwordController1.dispose();
    _nameController.dispose();


  }
  void signinUser(){
    authService.signinUser(context: context, email: _emailController1.text, password: _passwordController1.text);
  }

  void signUpUser(){
    authService.signUpUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text);
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: const Text("Welcome",
              style: TextStyle(fontSize: 22,
              fontWeight: FontWeight.bold),
              
              ),
              
            ),
            SizedBox(height: 8,),
            ListTile(
              tileColor: _auth == Auth.signup ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              title: const Text("Create Account",
              style: TextStyle(
                fontWeight: FontWeight.bold
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val){
                  setState(() {
                    _auth= val!;
                  });
                },
              )
            ),
            if(_auth == Auth.signup)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _signUpFormkey,
                  child: Column(children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: "Name", ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Email", ),
                    SizedBox(height: 8,),
                      CustomTextField(
                      controller: _passwordController,
                      hintText: "Password", ),
                    SizedBox(height: 8,),
                     CustomButton(text: "Sign up", onTap: (){ 
                      if (_signUpFormkey.currentState!.validate()) {
                        signUpUser();
                      }
                    })
                    
                  ]),
                ),
              ),
            
              
            ListTile(
              title: const Text("Sign-In",
              style: TextStyle(
                fontWeight: FontWeight.bold
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val){
                  setState(() {
                    _auth= val!;
                  });
                },
              )
            ),
            if(_auth == Auth.signin)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _signInFormkey,
                  child: Column(children: [
                    
                    SizedBox(height: 8,),
                    CustomTextField(
                      controller: _emailController1,
                      hintText: "Email", ),
                    SizedBox(height: 8,),
                      CustomTextField(
                      controller: _passwordController1,
                      hintText: "Password", ),  
                    SizedBox(height: 8,),
                    CustomButton(text: "Sign In", onTap: (){ 
                      if (_signInFormkey.currentState!.validate()) {
                        signinUser();
                      }
                    })
                  ]),
                ),
              ),
             

            ],
          ),
        )),
    );
  }
} 