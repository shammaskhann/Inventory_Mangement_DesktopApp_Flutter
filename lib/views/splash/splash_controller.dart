import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/services/Database/database_connection.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(PageName.dashboard_screen);
    });
  }
}
