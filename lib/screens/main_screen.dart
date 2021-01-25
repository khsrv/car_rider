import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            DatabaseReference dbref =
                FirebaseDatabase.instance.reference().child("Test");
            dbref.set("isConnected");
          },
          height: 60,
          minWidth: 300,
          color: Colors.red,
          child: Text("Test connection"),
        ),
      ),
    );
  }
}
