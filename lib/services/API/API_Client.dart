import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shopify_admin_dashboard/constant/Api/ApiConstant.dart';

class ApiClient {
  static Future getTodayOrdersCountInfoBlock() async {
    try {
      final Uri url = Uri.parse(
          "${ApiConstant.baseUrl}${ApiConstant.tagGetNoOfOrdersToday}");
      log("Getting Today's Sales: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Today's Sales: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getTodaySalesInfoBlock() async {
    try {
      final Uri url = Uri.parse(
          "${ApiConstant.baseUrl}${ApiConstant.tagGetTotalSalesToday}");
      log("Getting Today's Sales: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Today's Sales: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getTotalRevenue() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.tagGetTotalRevenue}");
      log("Getting Total Revenue: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Total Revenue: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getTotalCountOfProducts() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.tagGetTotalProducts}");
      log("Getting Total Products: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Total Products: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getTotalCountPastWeek() async {
    try {
      final Uri url = Uri.parse(
          "${ApiConstant.baseUrl}${ApiConstant.tagGetTotalOrderPastWeek}");
      log("Getting Total Products Past Week: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Total Products Past Week: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getGraphPastWeekOrder() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.graphPastWeekOrders}");
      log("Getting Graph Past Week Order: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Graph Past Week Order: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getTopSellingProducts() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.top5SellingProducts}");
      log("Getting Top 5 Selling Products: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Top 5 Selling Products: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getTopVendorPieChart() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.topVendorPieChart}");
      log("Getting Top Vendor Pie Chart: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Top Vendor Pie Chart: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
