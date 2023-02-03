import 'package:flutter/material.dart';
import 'package:tutorial_10/utils.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const MyButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.6,
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
