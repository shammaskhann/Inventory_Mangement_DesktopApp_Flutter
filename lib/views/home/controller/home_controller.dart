import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/graphmodels/VendorData.dart';
import 'package:shopify_admin_dashboard/data/models/mini-models/topSellingProductModel.dart';

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

  Future getTotalCountOfProducts() async {
    final res = await ApiClient.getTotalCountOfProducts();
    String totalProducts = res[0]['TotalProducts'].toString();
    return totalProducts;
  }

  Future<List<TopSellingProductModel>> getTopSellingProducts() async {
    log("Getting Top Selling Products");
    List<TopSellingProductModel> topSellingProducts = [];
    final res = await ApiClient.getTopSellingProducts();
    //add in TopSellingProductModel
    for (var item in res) {
      //log(item.toString());
      topSellingProducts.add(TopSellingProductModel(
          SKU: item['SKU'],
          productName: item['Name'],
          vendorName: item['SupplierName'],
          category: item['CategoryName'],
          quantitySold: item['TotalQuantitySold']));
    }
    //log(topSellingProducts.toString());
    return topSellingProducts;
  }

  Future<List<VendorData>> getTopVendorPieChart() async {
    log("Getting Top Vendor Pie Chart");
    List<VendorData> topVendorPieChart = [];
    final res = await ApiClient.getTopVendorPieChart();
    //add in VendorData
    for (var item in res) {
      //log(item.toString());
      topVendorPieChart
          .add(VendorData(item['SupplierName'], item['Percentage']));
    }
    //log(topVendorPieChart.toString());
    return topVendorPieChart;
  }
}
