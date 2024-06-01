import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/views/User/home-web/home-page.dart';

class LoginController extends GetxController {
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
        Get.offAllNamed(PageName.home_web_page);
        Get.snackbar("Login", "Login Successful");
      });
    } else {
      Get.snackbar("Login", "Invalid Email or Password");
    }
  }
}
