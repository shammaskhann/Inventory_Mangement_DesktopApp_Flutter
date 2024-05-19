import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/custommer_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/discount_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/giftcard_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/product_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/salechannel_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/shipper_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/graphmodels/PastWeekOrders.dart';
import 'package:shopify_admin_dashboard/data/models/orders/order_model.dart';
import 'package:shopify_admin_dashboard/data/models/orders/order_post.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  //TextEditingController for Order Insertion
  final orderDateController = TextEditingController();
  final customerIDController = TextEditingController();
  final discountCodeController = TextEditingController();
  RxString fulfillmentStatusController = ''.obs;
  final fulfilledDateController = TextEditingController();
  final salesChannelIDController = TextEditingController();
  final giftCardController = TextEditingController();
  RxString paymentMethodController = ''.obs;
  final paymentDateController = TextEditingController();
  final paymentStatusController = TextEditingController();
  final shipperIDController = TextEditingController();

  //dropdowns
  List<CustomerDropDown> customerDropDown = [];
  List<ProductDropDown> productDropDown = [];
  List<DiscountDropDown> discountDropDown = [];
  List<GiftCardDropDown> giftCardDropDown = [];
  List<ShipperDropDown> shipperDropDown = [];
  List<SalesChannelDropDown> salesChannelDropDown = [];

  // dropdown values
  RxInt selectedCustomerID = 0.obs;
//  RxList<ProductDropDown> selectedProductID =
//       List<ProductDropDown>.empty(growable: true).obs;
  RxString selectedDiscountID = ''.obs;
  RxInt selectedGiftCardID = 0.obs;
  RxInt selectedShipperID = 0.obs;
  RxInt selectedSalesChannelID = 0.obs;
  RxInt selectedProductID = 0.obs;
  //Order post Model
  final List<String> timeSpan = [
    'All',
    'Today',
    'Yesterday',
    'Last 7 days',
  ];
  RxString selectedTimeSpan = 'All'.obs;
  final formKey = GlobalKey<FormState>();
  final quantity = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    // await ApiClient.getOrderAccToParam('Today');
    //get dropdowns
    log('Order Controller Initiated');
    customerDropDown = await getCustomerDropDown();
    log('Customer drop Initiated ${customerDropDown.length}');
    productDropDown = await getProductDropDown();
    log('Product drop Initiated ${productDropDown.length}');
    shipperDropDown = await getShipperDropDown();
    log('Shipper drop Initiated ${shipperDropDown.length}');
    discountDropDown = await getDiscountDropDown();
    log('Discount drop Initiated ${discountDropDown.length}');
    giftCardDropDown = await getGiftCardDropDown();
    log('GiftCard drop Initiated ${giftCardDropDown.length}');
    salesChannelDropDown = await getSalesChannelDropDown();
    log('SalesChannel drop Initiated ${salesChannelDropDown.length}');
  }

  @override
  void onClose() {
    orderDateController.dispose();
    super.onClose();
  }

  Future<List> getOrderList(String selTimeSpan) async {
    if (selTimeSpan == 'All') {
      selTimeSpan = 'null';
    }
    final result = await ApiClient.getOrderAccToParam(selTimeSpan);
    // List<OrderView> orderList = [];
    // result.forEach((element) {
    //   orderList.add(OrderView.fromJson(element));
    // });
    return result;
  }

  Future getTodayOrders() async {
    final res = await ApiClient.getTodayOrdersCountInfoBlock();
    return res;
  }

  Future getPastWeekOrder() async {
    final res = await ApiClient.getTotalCountPastWeek();
    return res[0]['OrderCount'];
  }

  Future getGraphPastWeekOrders() async {
    List<PastWeekOrders> pastWeekOrders = [];
    final res = await ApiClient.getGraphPastWeekOrder();
    res.forEach((element) {
      DateTime orderDate = DateTime.parse(element['OrderDate']);
      String formattedDate = DateFormat('dd-MM-yyyy').format(orderDate);
      pastWeekOrders
          .add(PastWeekOrders(formattedDate, element['NumberOfOrders']));
    });
    return pastWeekOrders;
  }

  Future<List<CustomerDropDown>> getCustomerDropDown() async {
    final res = await ApiClient.getCustomerDropDown();
    List<CustomerDropDown> customerDropDown = [];
    res.forEach((element) {
      customerDropDown.add(CustomerDropDown.fromJson(element));
    });
    return customerDropDown;
  }

  Future<List<ProductDropDown>> getProductDropDown() async {
    final res = await ApiClient.getProductsDropDown();
    List<ProductDropDown> productDropDown = [];
    res.forEach((element) {
      productDropDown.add(ProductDropDown.fromJson(element));
    });
    return productDropDown;
  }

  Future<List<DiscountDropDown>> getDiscountDropDown() async {
    final res = await ApiClient.getDiscountCodeDropDown();
    List<DiscountDropDown> discountDropDown = [];
    res.forEach((element) {
      discountDropDown.add(DiscountDropDown.fromJson(element));
    });
    return discountDropDown;
  }

  Future<List<GiftCardDropDown>> getGiftCardDropDown() async {
    final res = await ApiClient.getGiftCardDropDown();
    List<GiftCardDropDown> giftCardDropDown = [];
    res.forEach((element) {
      giftCardDropDown.add(GiftCardDropDown.fromJson(element));
    });
    return giftCardDropDown;
  }

  Future<List<ShipperDropDown>> getShipperDropDown() async {
    final res = await ApiClient.getShipperDropDown();
    List<ShipperDropDown> shipperDropDown = [];
    res.forEach((element) {
      shipperDropDown.add(ShipperDropDown.fromJson(element));
    });
    return shipperDropDown;
  }

  Future<List<SalesChannelDropDown>> getSalesChannelDropDown() async {
    final res = await ApiClient.getSaleChannelDropDown();
    List<SalesChannelDropDown> salesChannelDropDown = [];
    res.forEach((element) {
      salesChannelDropDown.add(SalesChannelDropDown.fromJson(element));
    });
    return salesChannelDropDown;
  }

  void addOrder() {
    if (formKey.currentState!.validate()) {
      // Handle your order insertion
      // For example:
      // OrderModel order = OrderModel(
      //   orderDate: orderDateController.text,
      //   customerID: customerIDController.text,
      //   discountCode: discountCodeController.text,
      //   fulfillmentStatus: fulfillmentStatusController.text,
      //   fulfilledDate: fulfilledDateController.text,
      //   salesChannelID: salesChannelIDController.text,
      //   giftCard: giftCardController.text,
      //   paymentMethod: paymentMethodController.text,
      //   paymentDate: paymentDateController.text,
      //   paymentStatus: paymentStatusController.text,
      //   shipperID: shipperIDController.text,

      //   // Set other fields...
      // );
      // Insert your order
    }
  }

  // Future postOrder() async {
  //   final res = await ApiClient.postOrder(order);
  //   return res;
  // }

  void increment() {
    if (quantity.value < 10) {
      quantity.value++;
    } else {
      Get.snackbar('Error', 'Quantity cannot be more than 10',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    } else {
      Get.snackbar('Error', 'Quantity cannot be less than 1',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
