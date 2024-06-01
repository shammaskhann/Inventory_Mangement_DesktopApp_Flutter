import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/Api/ApiConstant.dart';
import 'package:shopify_admin_dashboard/data/models/inventory/inventory.dart';
import 'package:http/http.dart' as http;
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class HomeWebController extends GetxController {
  Future<List<Product>> getProducts() async {
    List<Product> products = [];

    try {
      final res = await ApiClient.getInventory();
      if (res != null) {
        List<Product> products = [];
        for (var item in res) {
          products.add(Product.fromJson(item));
        }
        return products;
      }
    } catch (e) {
      return [];
    }
    return []; // Add this line
  }
}
