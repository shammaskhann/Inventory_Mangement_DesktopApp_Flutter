import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/theme/app_themes.dart';
import '../../../data/models/inventory/inventory.dart';
import '../controller/UserController.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final UserController userController;

  ProductCard({required this.product, required this.userController});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool isExist =
        widget.userController.checkProductExistInCart(widget.product.productID);
    return Container(
      height: Get.width * 0.13,
      width: Get.width * 0.08,
      decoration: BoxDecoration(
        color: AppTheme.secondaryClr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: (widget.product.productStatus == 'Available')
                    ? const Color.fromARGB(192, 95, 248, 103)
                    : Colors.red.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                (widget.product.productStatus == 'Available')
                    ? 'In Stock'
                    : 'Out of Stock',
                style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: Get.width * 0.008,
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/${widget.product.productID}.png",
            height: Get.width * 0.07,
            width: Get.width * 0.07,
          ),
          const SizedBox(height: 10),
          Text(
            '${widget.product.supplierName} ${widget.product.product}',
            style: TextStyle(
              color: AppTheme.whiteselClr,
              fontSize: Get.width * 0.008,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '\$${widget.product.price}',
            style: TextStyle(
              color: AppTheme.whiteselClr,
              fontSize: Get.width * 0.008,
            ),
          ),
          const Spacer(),
          //add to cart button
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                widget.userController.addToCart(widget.product);
                log(widget.userController
                    .checkProductExistInCart(widget.product.productID)
                    .toString());
                setState(() {
                  isExist = widget.userController
                      .checkProductExistInCart(widget.product.productID);
                });
              },
              child: Container(
                height: Get.width * 0.025,
                decoration: BoxDecoration(
                  color: AppTheme.grasGreenClr,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (isExist)
                          ? Row(
                              children: [
                                // Decrease quantity button
                                InkWell(
                                  onTap: () {
                                    widget.userController
                                        .decreaseQuantity(widget.product);
                                    setState(() {});
                                  },
                                  child: Icon(Icons.remove),
                                ),

                                // Current quantity
                                Text(
                                  widget.userController
                                      .getQuantity(widget.product)
                                      .toString(),
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.009,
                                  ),
                                ),

                                // Increase quantity button
                                InkWell(
                                  onTap: () {
                                    widget.userController
                                        .increaseQuantity(widget.product);
                                    setState(() {});
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ],
                            )
                          : Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: AppTheme.whiteselClr,
                                fontSize: Get.width * 0.009,
                              ),
                            ),
                      const SizedBox(width: 5),
                      (!isExist)
                          ? Icon(
                              Icons.shopping_bag_outlined,
                              color: AppTheme.whiteselClr,
                              size: Get.width * 0.01,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
