import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  final Function onTap;

  AppBarBackButton({this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back_ios_rounded),
          Text(
            'BACK',
          )
        ],
      ),
    );
  }
}
