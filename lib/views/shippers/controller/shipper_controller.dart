import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class ShipperController extends GetxController {
  Future getShipper() async {
    // Get Shipper from API
    try {
      final response = await ApiClient.getShippers();
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
