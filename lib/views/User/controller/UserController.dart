import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/discount_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/giftcard_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/inventory/inventory.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

import '../../../data/models/dropdowns/shipper_dropdown.dart';

class UserController extends GetxController {
  late int userID;
  String userName = 'User';
  late String email;
  late String password;
  late String phoneNum;
  late String address;
  //productID,Quantity

  //update controller
  var updateNameController = TextEditingController();
  var updateEmailController = TextEditingController();
  var updatePasswordController = TextEditingController();
  var updatePhoneNumController = TextEditingController();
  var updateAddressController = TextEditingController();

  // ignore: non_constant_identifier_names

  RxList<RxMap<String, int>> cart = <RxMap<String, int>>[].obs;
  List<Product> productInCart = [];
  List<DiscountDropDown> discountDropDown = [];
  List<GiftCardDropDown> giftCardDropDown = [];
  List<ShipperDropDown> shipperDropDown = [];
  var addressController = TextEditingController();
  var phoneNumController = TextEditingController();
  RxInt selectedGiftCardID = 0.obs;
  RxInt selectedShipperID = 0.obs;
  RxString selectedDiscountID = ''.obs;
  RxString paymentMethod = 'Credit Card'.obs;
  RxDouble totalPrice = 0.0.obs;

  RxBool orderLoading = false.obs;
  @override
  void onInit() async {
    shipperDropDown = await getShipperDropDown();
    log('Shipper drop Initiated ${shipperDropDown.length}');
    discountDropDown = await getDiscountDropDown();
    log('Discount drop Initiated ${discountDropDown.length}');
    giftCardDropDown = await getGiftCardDropDown();
    log('GiftCard drop Initiated ${giftCardDropDown.length}');
  }

  void setUserID(int id) {
    userID = id;
  }

  void setUserName(String name) {
    userName = name;
    updateNameController = TextEditingController(text: name);
  }

  void setEmail(String email) {
    this.email = email;
    updateEmailController = TextEditingController(text: email);
  }

  void setPassword(String password) {
    this.password = password;
    updatePasswordController = TextEditingController(text: password);
  }

  void setPhoneNum(String phoneNum) {
    this.phoneNum = phoneNum;
    updatePhoneNumController = TextEditingController(text: phoneNum);
    phoneNumController = TextEditingController(text: phoneNum);
  }

  void setAddress(String address) {
    this.address = address;
    updateAddressController = TextEditingController(text: address);
    addressController = TextEditingController(text: address);
  }

  bool checkProductExistInCart(int productID) {
    for (var item in cart) {
      if (item['productID'] == productID) {
        return true;
      }
    }
    return false;
  }

  void addToCart(Product product) {
    String productID = product.productID.toString();
    if (checkProductExistInCart(product.productID)) {
      for (var item in cart) {
        if (item['productID'] == product.productID) {
          item['quantity'] = item['quantity']! + 1;
          updateTotalPrice();
          update();
          break;
        }
      }
    } else {
      RxMap<String, int> productAdd =
          {'productID': product.productID, 'quantity': 1}.obs;
      productInCart.add(product);
      cart.add(productAdd);
      updateTotalPrice();
      update();
    }
    log(cart.toString());
  }

  void increaseQuantity(Product product) {
    for (var item in cart) {
      if (item['productID'] == product.productID) {
        item['quantity'] = item['quantity']! + 1;
        break;
      }
    }
    updateTotalPrice();
    update();
    log(cart.toString());
  }

  int getQuantity(Product product) {
    for (var item in cart) {
      if (item['productID'] == product.productID) {
        return item['quantity']!;
      }
    }
    return 0;
  }

  void decreaseQuantity(Product product) {
    for (var item in cart) {
      if (item['productID'] == product.productID) {
        if (item['quantity']! > 1) {
          item['quantity'] = item['quantity']! - 1;
        } else {
          cart.remove(item);
        }
        break;
      }
    }
    updateTotalPrice();
    update();
    log(cart.toString());
  }

  void removeFromCart(Product product) {
    for (var item in cart) {
      if (item['productID'] == product.productID) {
        cart.remove(item);
        productInCart.remove(product);
        updateTotalPrice();
        break;
      }
    }
    log(cart.toString());
  }

  void updateTotalPrice() {
    double total = 0;
    for (var item in cart) {
      for (var product in productInCart) {
        if (product.productID == item['productID']) {
          total += product.price * item['quantity']!;
        }
      }
    }
    totalPrice.value = total;
    update();
  }

  void placeOrder() async {
    orderLoading.value = true;
    final response = await ApiClient.postOrder(
        customerID: userID,
        discountCode:
            selectedDiscountID.value == '' ? null : selectedDiscountID.value,
        fulfillmentStatus: "Pending",
        fulfilledDate: null,
        salesChannelID: 4,
        giftCard:
            selectedGiftCardID.value == 0 ? null : selectedGiftCardID.value,
        paymentMethod: paymentMethod.value,
        paymentDate: (paymentMethod.value == 'Cash on Delivery')
            ? null
            : DateTime.now().toString(),
        paymentStatus:
            (paymentMethod.value == 'Cash on Delivery') ? 'Pending' : 'Paid',
        shipperID: selectedShipperID.value,
        products: cart.toList());
    String msg = response['message'];
    if (msg == "Product Added Successfully!") {
      orderLoading.value = false;
      Get.snackbar('Order Placed', 'Order Placed Successfully');
      Get.offAllNamed(PageName.home_web_page);
      // clear all thr dropdown also
      selectedDiscountID.value = '';
      selectedGiftCardID.value = 0;
      selectedShipperID.value = 0;
      paymentMethod.value = 'Credit Card';
      addressController.clear();
      phoneNumController.clear();
      cart.clear();
      productInCart.clear();
      updateTotalPrice();
    } else {
      Get.snackbar('Order Failed', 'Order Failed');
      orderLoading.value = false;
      Get.offAllNamed(PageName.home_web_page);
    }
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

  RxBool updateLoading = false.obs;
  Future updateCustomer() async {
    updateLoading.value = true;
    final response = await ApiClient.updateCustomer(
        customerID: userID,
        name: updateNameController.text,
        email: updateEmailController.text,
        password: updatePasswordController.text,
        phone: updatePhoneNumController.text,
        address: updateAddressController.text);
    String msg = response['message'];
    if (msg == "Customer Updated Successfully!") {
      updateLoading.value = false;
      Get.snackbar('Customer Updated', 'Customer Updated Successfully');
      Get.offAllNamed(PageName.home_web_page);
    } else {
      updateLoading.value = false;
      Get.snackbar('Customer Update Failed', 'Customer Update Failed');
      Get.offAllNamed(PageName.home_web_page);
    }
  }

  Future getCustomerHistory() async {
    final response = await ApiClient.getCustomerHistory(userID);
    log(response.toString());
    return response;
  }
}
