import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/purchaseorder.dart/purchaseorder.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class PurchaseOrderController extends GetxController {
  Future<List<PurchaseOrder>> getPurchaseOrders() async {
    final res = await ApiClient.getPurchaseOrder();
    log(res.toString());
    List<PurchaseOrder> purchaseOrders = [];

    if (res != null) {
      for (var item in res) {
        purchaseOrders.add(PurchaseOrder.fromJson(item));
      }
    } else {
      log('getPurchaseOrder returned null');
    }
    return purchaseOrders;
  }
}
