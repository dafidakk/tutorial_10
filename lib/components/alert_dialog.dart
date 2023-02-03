import 'package:flutter/material.dart';
import 'package:tutorial_10/utils.dart';

class MyAlertDialog extends StatelessWidget {
  final String message;
  const MyAlertDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade600,
      title: Text(
        message,
        style: textStyle(15, Colors.white, FontWeight.w500),
      ),
    );
  }
}
