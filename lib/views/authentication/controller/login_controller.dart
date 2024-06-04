import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';
import 'package:shopify_admin_dashboard/views/User/controller/UserController.dart';
import 'package:shopify_admin_dashboard/views/User/home-web/home-page.dart';

class LoginController extends GetxController {
  // UserController userController = Get.put(UserController(), permanent: true);
  UserController userController = Get.find<UserController>();
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

//   CREATE PROCEDURE LoginCustomer
//     @Email NVARCHAR(50),
//     @Password NVARCHAR(50)
// AS
// BEGIN
//     IF EXISTS (SELECT 1 FROM Customers WHERE Email = @Email AND Password = @Password)
//     BEGIN
//         SELECT CustomerID, Name, Email, PhoneNumber, Address, Password
//         FROM Customers
//         WHERE Email = @Email AND Password = @Password;
//     END
//     ELSE
//     BEGIN
//         SELECT 'Invalid credentials' AS ErrorMessage;
//     END
// END;
  // response from sql server
// CustomerID	Name	Email	PhoneNumber	Address	Password
// 12	Shammas Khan	skspawnpersonal@gmail.com	0345-0491-621	21st Street Street karachi	O8bZl6bC
  void login() async {
    if (validateEmail(emailController.text) &&
        validatePassword(passwordController.text)) {
      isLoading.value = true;

      final res = await ApiClient.loginCustomer(
          emailController.text, passwordController.text);
      isLoading.value = false;

      if (res != null && res['ErrorMessage'] == null) {
        userController.setUserID(res['CustomerID']);
        userController.setUserName(res['Name']);
        userController.setEmail(res['Email']);
        userController.setPhoneNum(res['PhoneNumber']);
        userController.setAddress(res['Address']);
        userController.setPassword(res['Password']);
        isLoading.value = false;
        Get.offAllNamed(PageName.home_web_page);
      } else {
        isLoading.value = false;
        Get.snackbar(
          "Login",
          "Invalid Email or Password",
          maxWidth: Get.width * 0.5,
          backgroundColor: AppTheme.grasGreenClr,
          colorText: AppTheme.whiteselClr,
        );
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Login",
        "Invalid Email or Password",
        maxWidth: Get.width * 0.5,
        backgroundColor: AppTheme.grasGreenClr,
        colorText: AppTheme.whiteselClr,
      );
    }
  }
}
