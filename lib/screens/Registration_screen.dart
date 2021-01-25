import 'package:car_rider/styles/brand_colors.dart';
import 'package:car_rider/widgets/TaxiButton.dart';
import "package:flutter/material.dart";

import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = "register";
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(height: 50),
              Image(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                image: AssetImage("assets/images/logo.png"),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Create a rider\'s account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 25,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      //Full name
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Full name",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Email address
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email address",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Phonr number
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone number",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TaxiButton(
                        tittle: "REGISTER",
                        color: BrandColors.colorGreen,
                        onPressed: () {},
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.id, (routes) => false);
                        },
                        child: Text("Already have a rider account? Log in"),
                      )
                    ],
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
