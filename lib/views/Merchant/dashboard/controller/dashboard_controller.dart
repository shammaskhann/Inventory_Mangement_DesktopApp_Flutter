import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/services/Database/database_connection.dart';

class DashboardController extends GetxController {
  DatabaseServices databaseServices = DatabaseServices();
  RxBool isConnectingDatabase = true.obs;
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
