import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/Api/ApiConstant.dart';
import 'package:http/http.dart' as http;
import 'package:shopify_admin_dashboard/data/models/graphmodels/discount_barchart.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class DiscountController extends GetxController {
  final key = GlobalKey<FormState>();
  final discountCode = TextEditingController();
  final discountAmount = TextEditingController();
  bool refrresh = false;
  Future getDiscountCode() async {
    try {
      final response = await ApiClient.getDiscountCodes();
      //log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<DiscountData>> getChartdata() async {
    //List<DiscountData> chartData = apiData.map((item) => DiscountData(item['DiscountCode'], item['NoOfOrders'])).toList();
    List<DiscountData> data = [];
    try {
      final response = await ApiClient.getDiscountCodes();
      for (var item in response) {
        log(item['DiscountCode']);
        data.add(DiscountData(item['DiscountCode'], item['NoOfOrders']));
      }
    } catch (e) {
      log(e.toString());
    }
    return data;
  }

  Future postDiscountCode(String discountcode, double discountamount) async {
    try {
      final response = await ApiClient.postDiscountCode(
          discountcode: discountcode, discountamount: discountamount);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  addDiscountCode() async {
    if (key.currentState!.validate()) {
      // Add customer logic here
      final res = await ApiClient.postDiscountCode(
        discountcode: discountCode.text,
        discountamount: double.parse(discountAmount.text),
      );
      discountCode.clear();
      discountAmount.clear();
      String msg = res['message'];
      if (msg == "Discount Code Added Successfully!") {
        Get.back(); // Close the dialog
        Get.snackbar(
          'Success',
          msg,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        refrresh = !refrresh;
        update();
      } else {
        Get.snackbar(
          'Error',
          msg,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
