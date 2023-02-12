import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_10/controller/auth_controller.dart';
import 'package:tutorial_10/screens/auth_screen.dart';
import 'package:tutorial_10/screens/home_screen.dart';

class Root extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return authController.user.value == null
            ? AuthScreen()
            :  HomeScreen();
      },
    );
  }
}
