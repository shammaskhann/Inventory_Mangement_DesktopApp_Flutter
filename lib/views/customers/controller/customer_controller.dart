import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/data/models/orders/customer_model.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class CustomersController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool refrresh = false;
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    } else {
      return null;
    }
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!GetUtils.isPhoneNumber(value)) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }

  Future addCustomer() async {
    if (formKey.currentState!.validate()) {
      // Add customer logic here
      final res = await ApiClient.postCustomer(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
      );
      nameController.clear();
      emailController.clear();
      addressController.clear();
      phoneController.clear();
      String msg = res['message'];
      if (msg == "Customer Added Successfully!") {
        Get.back(); // Close the dialog
        Get.snackbar(
          'Success',
          msg,
          backgroundColor: AppTheme.grasGreenClr,
          colorText: Colors.white,
        );
        refrresh = !refrresh;
        update();
      } else {
        Get.snackbar(
          'Error',
          msg,
          backgroundColor: AppTheme.grasGreenClr,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        backgroundColor: AppTheme.grasGreenClr,
        colorText: Colors.white,
      );
    }
  }

  Future<List<Customer>> getCustomers() async {
    List<Customer> customers = [];
    final res = await ApiClient.getCustomers();
    if (res != null) {
      for (var item in res) {
        customers.add(Customer.fromJson(item));
      }
    }
    return customers;
  }
}
