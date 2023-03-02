import 'package:flutter/material.dart';

import '../utils.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final double textWidth;
  final TextInputType? keyboardType;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.textWidth,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: textWidth,
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obsecureText,
          style: textStyle(16, Colors.black, FontWeight.w500),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: hintText,
            hintStyle: textStyle(16, Colors.grey.shade400, FontWeight.w500),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
