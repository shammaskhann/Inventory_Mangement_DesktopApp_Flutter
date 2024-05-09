import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class SalesServices {
  //ApiClient apiClient = ApiClient();
  static Future<String> getTodaySales() async {
    //make a full api call structure so when the api ready i dont have to do modification
    // method to convert hundred thousand  to K
    return Future.delayed(Duration(seconds: 2), () => "90K");
  }

  //get Today Order
  static Future<String> getTodayOrder() async {
    //make a full api call structure so when the api ready i dont have to do modification
    // method to convert hundred thousand  to K
    return Future.delayed(Duration(seconds: 2), () => "12");
  }

  //get Total Revenue
  static Future<String> getTotalRevenue() async {
    //make a full api call structure so when the api ready i dont have to do modification
    // method to convert hundred thousand  to K
    return Future.delayed(Duration(seconds: 2), () => "1.2M");
  }

  //get Total Products
  static Future<String> getTotalProducts() async {
    //make a full api call structure so when the api ready i dont have to do modification
    // method to convert hundred thousand  to K
    return Future.delayed(Duration(seconds: 2), () => "16");
  }
}
