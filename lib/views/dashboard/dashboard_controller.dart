import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/services/Database/database_connection.dart';

class DashboardController extends GetxController {
  DatabaseServices databaseServices = DatabaseServices();
  RxBool isConnectingDatabase = true.obs;
  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  //   bool connected = await databaseServices.connectDb();
  //   log('Database Connection: $connected');
  //   if (!connected) {
  //     Get.snackbar('Error', 'Database Connection Failed');
  //     isConnectingDatabase = false.obs;
  //     return;
  //   }
  //   isConnectingDatabase = false.obs;
  // }
}
