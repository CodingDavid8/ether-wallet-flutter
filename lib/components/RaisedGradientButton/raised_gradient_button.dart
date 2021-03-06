import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final gradient;

  RaisedGradientButton({this.label, this.onPressed, @required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            gradient: gradient, borderRadius: BorderRadius.circular(10)),
        height: 55,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.transparent,
          child: Text(
            label,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          onPressed: () => onPressed,
        ),
      ),
    );
  }
}
