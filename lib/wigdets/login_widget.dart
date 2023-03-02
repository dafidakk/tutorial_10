import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_10/components/alert_dialog.dart';
import 'package:tutorial_10/components/my_button.dart';
import 'package:tutorial_10/components/my_textfield.dart';
import 'package:tutorial_10/controller/auth_controller.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertDialog(message: message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    AuthController authController = Get.find<AuthController>();

    return Column(
      children: [
        MyTextField(
            textWidth: MediaQuery.of(context).size.width,
            controller: emailcontroller,
            hintText: 'Email',
            obsecureText: false),
        const SizedBox(height: 16),
        MyTextField(
            textWidth: MediaQuery.of(context).size.width,
            controller: passwordcontroller,
            hintText: 'Password',
            obsecureText: true),
        const SizedBox(
          height: 20,
        ),
        MyButton(
            textWidth: MediaQuery.of(context).size.width * 0.6,
            text: 'Login',
            onPressed: () {
              authController.loginUser(
                emailcontroller.text,
                passwordcontroller.text,
              );
              showErrorMessage(authController.errorCode);
            }),
      ],
    );
  }
}
