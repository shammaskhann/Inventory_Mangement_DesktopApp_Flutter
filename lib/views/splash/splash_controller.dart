import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/services/Database/database_connection.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    DatabaseServices databaseServices = DatabaseServices();
    bool res = await databaseServices.checkDbConnection();
    (res)
        ? Future.delayed(const Duration(seconds: 3), () {
            Get.offNamed(PageName.dashboard_screen);
          })
        : Get.offNamed(PageName.error_screen);
  }
}
