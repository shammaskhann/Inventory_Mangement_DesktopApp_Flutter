import 'package:get/get.dart';

class InventoryController extends GetxController {
  List<String> categories = [
    'All',
    'Smartphones',
    'Laptops,'
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
}
