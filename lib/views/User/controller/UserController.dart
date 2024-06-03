import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/inventory/inventory.dart';

class UserController extends GetxController {
  late String userName;
  late String email;
  late String password;
  late String phoneNum;
  late String address;
  //productID,Quantity
  // ignore: non_constant_identifier_names

  RxList<RxMap<String, int>> cart = <RxMap<String, int>>[].obs;
  List<Product> productInCart = [];

  bool checkProductExistInCart(int productID) {
    for (var item in cart) {
      if (item.containsKey(productID.toString())) {
        return true;
      }
    }
    return false;
  }

  void addToCart(Product product) {
    String productID = product.productID.toString();
    if (checkProductExistInCart(product.productID)) {
      for (var item in cart) {
        if (item.containsKey(productID)) {
          item[productID] = item[productID]! + 1;
          break;
        }
      }
    } else {
      RxMap<String, int> productAdd = {productID: 1}.obs;
      productInCart.add(product);
      cart.add(productAdd);
    }
    log(cart.toString());
  }

  void increaseQuantity(Product product) {
    String productID = product.productID.toString();
    for (var item in cart) {
      if (item.containsKey(productID)) {
        item[productID] = item[productID]! + 1;
        break;
      }
    }
    update();
    log(cart.toString());
  }

  int getQuantity(Product product) {
    String productID = product.productID.toString();
    for (var item in cart) {
      if (item.containsKey(productID)) {
        return item[productID]!;
      }
    }
    return 0;
  }

  void decreaseQuantity(Product product) {
    String productID = product.productID.toString();
    for (var item in cart) {
      if (item.containsKey(productID)) {
        if (item[productID]! > 1) {
          item[productID] = item[productID]! - 1;
        } else {
          cart.remove(item);
        }
        break;
      }
    }
    update();
    log(cart.toString());
  }

  void removeFromCart(Product product) {
    String productID = product.productID.toString();
    for (var item in cart) {
      if (item.containsKey(productID)) {
        cart.remove(item);
        productInCart.remove(product);
        break;
      }
    }
    log(cart.toString());
  }
}
