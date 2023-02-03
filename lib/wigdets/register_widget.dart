import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_10/controller/auth_controller.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    AuthController authController = Get.find<AuthController>();

    return Column(
      children: [
        MyTextField(
            controller: emailcontroller,
            hintText: 'Email',
            obsecureText: false),
        const SizedBox(height: 16),
        MyTextField(
            controller: usernamecontroller,
            hintText: 'Username',
            obsecureText: false),
        const SizedBox(height: 16),
        MyTextField(
            controller: passwordcontroller,
            hintText: 'Password',
            obsecureText: true),
        const SizedBox(
          height: 20,
        ),
        MyButton(
          // implement register credentials check password creteria etc.
          text: 'Register',
          onPressed: () => authController.registerUser(
            emailcontroller.text,
            passwordcontroller.text,
            usernamecontroller.text,
          ),
        )
      ],
    );
  }
}
