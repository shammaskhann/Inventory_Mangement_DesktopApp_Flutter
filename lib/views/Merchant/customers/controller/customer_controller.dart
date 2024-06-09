import 'dart:developer';

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
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController updateNameController = TextEditingController();
  final TextEditingController updateEmailController = TextEditingController();
  final TextEditingController updateAddressController = TextEditingController();
  final TextEditingController updatePasswordController =
      TextEditingController();
  final TextEditingController updatePhoneController = TextEditingController();
  RxBool loading = false.obs;
  bool refrresh = false;
  RxBool updtLoad = false.obs;
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
    loading.value = true;
    if (formKey.currentState!.validate()) {
      // Add customer logic here
      final res = await ApiClient.postCustomer(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
        password: passwordController.text,
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
        loading.value = false;
      } else {
        Get.snackbar(
          'Error',
          msg,
          backgroundColor: AppTheme.grasGreenClr,
          colorText: Colors.white,
        );
        loading.value = false;
      }
    } else {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        backgroundColor: AppTheme.grasGreenClr,
        colorText: Colors.white,
      );
      loading.value = false;
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

  Future updateCustomer(int id) async {
    updtLoad.value = true;
    final res = await ApiClient.updateCustomer(
      customerID: id,
      name: updateNameController.text,
      email: updateEmailController.text,
      phone: updatePhoneController.text,
      address: updateAddressController.text,
      password: updatePasswordController.text,
    );
    updateNameController.clear();
    updateEmailController.clear();
    updateAddressController.clear();
    updatePhoneController.clear();
    updatePasswordController.clear();
    String msg = res['message'];
    updtLoad.value = false;
    if (msg == "Customer Updated Successfully!") {
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
      updtLoad = false.obs;
      Get.snackbar(
        'Error',
        msg,
        backgroundColor: AppTheme.grasGreenClr,
        colorText: Colors.white,
      );
    }
  }
}
