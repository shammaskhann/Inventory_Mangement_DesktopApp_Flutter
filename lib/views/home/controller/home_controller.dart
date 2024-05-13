import 'package:get/get.dart';

import '../../../services/API/API_Client.dart';

class HomeController extends GetxController {
  Future<String> getTodayOrderCountInfoBlock() async {
    final res = await ApiClient.getTodayOrdersCountInfoBlock();
    String todaySales = res[0]['NumberOfOrdersToday'].toString();
    return todaySales;
  }

  Future<String> getTodaySalesInfoBlock() async {
    final res = await ApiClient.getTodaySalesInfoBlock();
    double todaySales = double.parse(res[0]['TotalSalesToday'].toString());

    // Convert to integer and get the length
    int length = todaySales.toInt().toString().length;

    // Change String into K if in Thousand and M if in Million
    if (length > 6) {
      todaySales = todaySales / 1000000;
      return todaySales.toStringAsFixed(2) + 'M';
    } else if (length > 3) {
      todaySales = todaySales / 1000;
      return todaySales.toStringAsFixed(2) + 'K';
    } else {
      return todaySales.toStringAsFixed(2);
    }
  }

  Future<String> getTotalRevenue() async {
    final res = await ApiClient.getTotalRevenue();
    double totalRevenue = double.parse(res[0]['TotalRevenue'].toString());

    // Convert to integer and get the length
    int length = totalRevenue.toInt().toString().length;

    // Change String into K if in Thousand and M if in Million
    if (length > 6) {
      totalRevenue = totalRevenue / 1000000;
      return totalRevenue.toStringAsFixed(2) + 'M';
    } else if (length > 3) {
      totalRevenue = totalRevenue / 1000;
      return totalRevenue.toStringAsFixed(2) + 'K';
    } else {
      return totalRevenue.toStringAsFixed(2);
    }
  }

  Future<String> getTotalCountOfProducts() async {
    final res = await ApiClient.getTotalCountOfProducts();
    String totalProducts = res[0]['TotalProducts'].toString();
    return totalProducts;
  }
}
