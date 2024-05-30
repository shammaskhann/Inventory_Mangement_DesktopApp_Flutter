import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/shipments/shipment_model.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class ShipperController extends GetxController {
  RxBool loading = false.obs;
  RxString trackingStatus = ''.obs;
  bool rreefresh = false;
  Future<List<ShipmentModel>> getShippers() async {
    List<ShipmentModel> shippers = [];
    try {
      var response = await ApiClient.getShipments();
      if (response != null) {
        for (var item in response) {
          shippers.add(ShipmentModel.fromJson(item));
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return shippers;
  }

  updateTrackingStatus(int orderID) async {
    loading.value = true;
    try {
      var response = await ApiClient.updateShipmentStatus(
          orderID: orderID, newStatus: trackingStatus.value.toString());
      rreefresh = !rreefresh;
      update();
      loading.value = false;
      trackingStatus.value = '';
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
  }
}
