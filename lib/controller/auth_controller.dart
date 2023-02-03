import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tutorial_10/utils.dart';
import 'dart:developer';

class AuthController extends GetxController {
  RxString tab = 'Login'.obs;
  String errorCode = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  changeTab(value) {
    tab.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuth.authStateChanges());
  }

  registerUser(String email, String password, String username) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;

    if (user != null) {
      userCollection.doc(user.uid).set(
        {'email': email, 'username': username},
      );
    }
  }

  loginUser(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log('User logged in');
    } on FirebaseAuthException catch (e) {
      log(e.code);
      errorCode = e.code;
    }
  }
}
