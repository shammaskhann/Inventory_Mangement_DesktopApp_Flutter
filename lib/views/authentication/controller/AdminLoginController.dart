import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';

class AdminLoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateEmail(String email) {
    if (email.isEmpty) {
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

  void login() {
    if (validateEmail(emailController.text) &&
        validatePassword(passwordController.text)) {
      isLoading.value = true;
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;
        if (emailController.text == "admin" &&
            passwordController.text == "admin") {
          Get.snackbar("Login", "Login Successful");
          Get.offAllNamed(PageName.splash_screen);
        } else {
          Get.snackbar("Login", "Invalid Email or Password");
        }
      });
    } else {
      Get.snackbar("Login", "Invalid Email or Password");
    }
  }
}
