import 'package:flutter/material.dart';
import 'package:tutorial_10/wigdets/login_widget.dart';
import 'package:tutorial_10/wigdets/register_widget.dart';

import '../utils.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  buildTab(text, selected, context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 40,
      child: Center(
        child: Text(
          text,
          style: selected
              ? textStyle(22, Colors.lightBlue, FontWeight.bold)
              : textStyle(22, Colors.grey, FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Wishly",
                style: textStyle(35, Colors.lightBlue[400]!, FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTab("Login", true, context),
                  buildTab("Register", false, context),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const LoginWidget(),
              const RegisterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
