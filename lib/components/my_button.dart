import 'package:flutter/material.dart';
import 'package:tutorial_10/utils.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double textWidth;
  const MyButton({super.key, this.onPressed, required this.text, required this.textWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: textWidth ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.lightBlue,
        ),
        child: Text(
          text,
          style: textStyle(20, Colors.white, FontWeight.bold),
        ),
      ),
    );
  }
}
