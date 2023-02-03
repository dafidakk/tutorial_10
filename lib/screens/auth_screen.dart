import 'package:flutter/material.dart';
import 'package:tutorial_10/controller/auth_controller.dart';
import 'package:tutorial_10/wigdets/login_widget.dart';
import 'package:tutorial_10/wigdets/register_widget.dart';
import 'package:get/get.dart';

import '../utils.dart';

class AuthScreen extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
  buildTab(text, selected, context) {
    return SizedBox(
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
                'Wishly',
                style: textStyle(35, Colors.lightBlue[400]!, FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => authController.changeTab('Login'),
                      child: buildTab('Login',
                          authController.tab.value == 'Login', context),
                    ),
                    InkWell(
                      onTap: () => authController.changeTab('Register'),
                      child: buildTab('Register',
                          authController.tab.value == 'Register', context),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => authController.tab.value == 'Login'
                  ? const LoginWidget()
                  : const RegisterWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
