import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumController = TextEditingController();
  final addressController = TextEditingController();

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

  bool validatePhoneNum(String phoneNum) {
    if (phoneNum.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateAddress(String address) {
    if (address.isEmpty) {
      return false;
    }
    return true;
  }

  void signup() async {
    isLoading.value = true;
    if (validateEmail(emailController.text) &&
        validateUsername(usernameController.text) &&
        validatePassword(passwordController.text) &&
        validatePhoneNum(phoneNumController.text) &&
        validateAddress(addressController.text)) {
      final res = await ApiClient.postCustomer(
        name: usernameController.text,
        email: emailController.text,
        phone: phoneNumController.text,
        address: addressController.text,
        password: passwordController.text,
      );
      String msg = res['message'];
      if (msg == "Customer Added Successfully!") {
        isLoading.value = false;
        Get.snackbar("Login", "Login Successful");
        Get.offAllNamed(PageName.auth_screen);
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          msg,
          maxWidth: Get.width * 0.4,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
      Get.snackbar("Login", "Invalid Email, Username or Password");
    }
  }
}
