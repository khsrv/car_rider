import 'package:flutter/material.dart';

class TaxiButton extends StatelessWidget {
  final String tittle;
  final Color color;
  final Function onPressed;

  TaxiButton({this.tittle, this.color,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25),
      ),
      color: color,
      textColor: Colors.white,
      child: Container(
        height: 50,
        child: Center(
          child: Text(tittle,
              style: TextStyle(fontSize: 18, fontFamily: "Montserrat-Bold")),
        ),
      ),
    );
  }
}
