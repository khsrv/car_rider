import 'package:car_rider/screens/main_screen.dart';
import 'package:car_rider/styles/brand_colors.dart';
import 'package:car_rider/widgets/TaxiButton.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity/connectivity.dart';

import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "register";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String tittle) {
    final snackBar = SnackBar(
      content: Text(tittle,
          textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
    );
    scaffoldkey.currentState.showSnackBar(snackBar);
  }

  var fullNameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  void registerUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        DatabaseReference newUserRef = FirebaseDatabase.instance
            .reference()
            .child('users/${userCredential.user.uid}');
        Map userMap = {
          "fullname": fullNameController.text,
          "email": emailController.text,
          "phone": phoneController.text
        };
        newUserRef.set(userMap);
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //print('The password provided is too weak.');
        showSnackBar('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        showSnackBar('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
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
                        onPressed: () async {
                          var connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult != ConnectivityResult.mobile &&
                              connectivityResult != ConnectivityResult.wifi) {
                            showSnackBar("No internet connect");
                            return;
                          }
                          if (fullNameController.text.length < 3) {
                            showSnackBar("Plese provide a valid fullname");
                            return;
                          }
                          if (phoneController.text.length < 10) {
                            showSnackBar("Please provide  valid phone number");
                            return;
                          }

                          if (!emailController.text.contains('@')) {
                            showSnackBar("Please provide  valid email address");
                            return;
                          }
                          if (passwordController.text.length < 8) {
                            showSnackBar("Password must be least 8 character");
                            return;
                          }

                          registerUser();
                        },
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
