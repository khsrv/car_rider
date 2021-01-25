import 'package:car_rider/screens/Registration_screen.dart';
import 'package:car_rider/styles/brand_colors.dart';
import 'package:car_rider/widgets/TaxiButton.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "login";
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
                "Sign in as a rider",
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

                      //Email
                      TextField(
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

                      //Password
                      TextField(
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
                        tittle: "LOGIN",
                        color: BrandColors.colorGreen,
                        onPressed: () {},
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RegistrationScreen.id, (route) => false);
                        },
                        child: Text("Don\'t have an account, sign up here"),
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
