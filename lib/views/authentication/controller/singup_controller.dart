import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateUsername(String username) {
    if (username.isEmpty) {
      return false;
    }
    return true;
  }

  bool validatePassword(String password) {
    if (password.isEmpty) {
      return false;
    }
    return true;
  }

  void signup() {
    if (validateEmail(emailController.text) &&
        validateUsername(usernameController.text) &&
        validatePassword(passwordController.text)) {
      isLoading.value = true;
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;
        Get.snackbar("Login", "Login Successful");
      });
    } else {
      Get.snackbar("Login", "Invalid Email, Username or Password");
    }
  }
}
