import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/suppliers/suppliers.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class SupplierController extends GetxController {
  Future<List<Supplier>> getSuppliers() async {
    final res = await ApiClient.getSuppliers();
    if (res != null) {
      List<Supplier> suppliers = [];
      for (var item in res) {
        suppliers.add(Supplier.fromJson(item));
      }
      return suppliers;
    } else {
      return [];
    }
  }
}
