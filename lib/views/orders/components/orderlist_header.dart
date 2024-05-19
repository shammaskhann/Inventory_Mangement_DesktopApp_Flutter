import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/theme/app_themes.dart';

class OrderListHeader extends StatelessWidget {
  const OrderListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.05,
            child: Text(
              'OrderID',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.07,
            child: Text(
              'Customer',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.11,
            child: Text(
              'Product',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.05,
            child: Text(
              'OrderDate',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.07,
            child: const Text(
              'Status',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: const Text(
              'Channel',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.05,
            child: Text(
              'Discount Code',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.05,
            child: Text(
              'GiftCard',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.05,
            child: Text(
              'Sub-Total',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.05,
            child: Text(
              'Shipping',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.05,
            child: Text(
              'Total',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.05,
            child: Text(
              'Payment Status',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: width * 0.009,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
