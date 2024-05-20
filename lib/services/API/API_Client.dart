import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shopify_admin_dashboard/constant/Api/ApiConstant.dart';

class ApiClient {
  static Future getTodayOrdersCountInfoBlock() async {
    try {
      final Uri url = Uri.parse(
          "${ApiConstant.baseUrl}${ApiConstant.tagGetNoOfOrdersToday}");
      //  log("Getting Today's Sales: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        // log("Today's Sales: $response");
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
      // log("Getting Today's Sales: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        // log("Today's Sales: $response");
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
      // log("Getting Total Revenue: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //  log("Total Revenue: $response");
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
      //  log("Getting Total Products: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        // log("Total Products: $response");
        return response;
      } else {
        //log("Error: ${result.body}");
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
      //  log("Getting Total Products Past Week: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        // log("Total Products Past Week: $response");
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
      // log("Getting Graph Past Week Order: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        // log("Graph Past Week Order: $response");
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
      //log("Getting Top 5 Selling Products: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        // log("Top 5 Selling Products: $response");
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
      //log("Getting Top Vendor Pie Chart: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Top Vendor Pie Chart: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getOrderAccToParam(String Period) async {
    try {
      final Uri url = Uri.parse(
          "${ApiConstant.baseUrl}${ApiConstant.getOrderAccToParam}/$Period");
      //log("Getting Order According to Param: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Order According to Param: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getCustomers() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getCustomers}");
      log("Getting Customers: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        log("Customers: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getInventory() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getInventory}");
      //log("Getting Inventory: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Inventory: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getSuppliers() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getSuppliers}");
      //log("Getting Suppliers: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Suppliers: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getShippers() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getShippers}");
      //log("Getting Shippers: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Shippers: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getSalesChannel() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getSalesChannel}");
      //log("Getting Sales Chart: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Sales Chart: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getInvoices() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getInvoices}");
      //log("Getting Invoices: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Invoices: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getPurchaseOrder() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getPurchaseOrder}");
      //log("Getting Purchase Order: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Purchase Order: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future postCustomer(
      {required String name,
      required String email,
      required String address,
      required String phone}) async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.postCustomer}");
      //log("Posting Customer: $url");
      final result = await http.post(
        url,
        body: jsonEncode({
          "customerName": name,
          "customerEmail": email,
          "customerNum": phone,
          "customerAddress": address,
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Customer Posted: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getShipperDropDown() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.shipperDropDown}");
      //log("Getting Shipper Drop Down: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Shipper Drop Down: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getCustomerDropDown() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.customerDropDown}");
      //log("Getting Customer Drop Down: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Customer Drop Down: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getDiscountCodeDropDown() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.discountDropDown}");
      //log("Getting Discount Code Drop Down: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Discount Code Drop Down: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getGiftCardDropDown() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.giftCardDropDown}");
      //log("Getting Gift Card Drop Down: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Gift Card Drop Down: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getProductsDropDown() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.productDropDown}");
      //log("Getting Product Drop Down: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Product Drop Down: $response");
        return response;
      } else {
        //log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getSaleChannelDropDown() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.saleChannelDropDown}");
      //log("Getting Sale Channel Drop Down: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Sale Channel Drop Down: $response");
        return response;
      } else {
        //log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

// var products = [
//     {'productID': 101, 'quantity': 2},
//     {'productID': 102, 'quantity': 3},
//     // Add more products as needed
//   ];

//   var body = jsonEncode({
//     'orderDate': '2021-12-01', // Replace with actual data
//     'customerID': 1, // Replace with actual data
//     'discountCode': 'DISCOUNT10', // Replace with actual data
//     'fulfillmentStatus': 'Fulfilled', // Replace with actual data
//     'fulfilledDate': '2021-12-02', // Replace with actual data
//     'salesChannelID': 1, // Replace with actual data
//     'giftCard': 0, // Replace with actual data
//     'paymentMethod': 'Credit Card', // Replace with actual data
//     'paymentDate': '2021-12-01', // Replace with actual data
//     'paymentStatus': 'Paid', // Replace with actual data
//     'shipperID': 1, // Replace with actual data
//     'products': products,
//   });
  static Future postOrder(
      {required String orderDate,
      required int customerID,
      required String discountCode,
      required String fulfillmentStatus,
      required String? fulfilledDate,
      required int salesChannelID,
      required int? giftCard,
      required String paymentMethod,
      required String? paymentDate,
      required String paymentStatus,
      required int shipperID,
      required List<Map<String, int>> products}) async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.postOrder}");
      //log("Posting Order: $url");
      final result = await http.post(
        url,
        body: jsonEncode({
          'orderDate': orderDate,
          'customerID': customerID,
          'discountCode': discountCode,
          'fulfillmentStatus': fulfillmentStatus,
          'fulfilledDate': fulfilledDate,
          'salesChannelID': salesChannelID,
          'giftCard': giftCard,
          'paymentMethod': paymentMethod,
          'paymentDate': paymentDate,
          'paymentStatus': paymentStatus,
          'shipperID': shipperID,
          'productIDs': products,
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Order Posted: $response");
        return response;
      } else {
        log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getDiscountCodes() async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.getDiscount}");
      //log("Getting Discount Codes: $url");
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Discount Codes: $response");
        return response;
      } else {
        //log("Error: ${result.body}");
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future postDiscountCode(
      {required String discountcode, required double discountamount}) async {
    try {
      final Uri url =
          Uri.parse("${ApiConstant.baseUrl}${ApiConstant.postDiscount}");
      //log("Posting Discount Code: $url");
      final result = await http.post(
        url,
        body: jsonEncode({
          'discountcode': discountcode,
          'discountamount': discountamount,
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        //log("Discount Code Posted: $response");
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
