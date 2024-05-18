import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/inventory/inventory.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class InventoryController extends GetxController {
  List<String> categories = [
    'All',
    'Smartphones',
    'Laptops',
    'Tablets',
    'Smartwatches',
    'Headphones',
    'Cameras',
    'Televisions',
    'Gaming Consoles',
    'Smart Home Devices',
    'Computer Accessories',
  ];

  RxString seletedCategory = 'All'.obs;

  Future<List<Product>> getProducts() async {
    final res = await ApiClient.getInventory();
    if (res != null) {
      List<Product> products = [];
      for (var item in res) {
        products.add(Product.fromJson(item));
      }
      return products;
    } else {
      return [];
    }
  }
}
