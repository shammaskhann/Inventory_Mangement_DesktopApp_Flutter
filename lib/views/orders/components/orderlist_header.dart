import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/theme/app_themes.dart';

class OrderListHeader extends StatelessWidget {
  const OrderListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(
          //   width: 60,
          // ),
          SizedBox(
            width: width * 0.1,
            child: const Text(
              'Order ID',
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
              'Customer',
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
              'Product',
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
              'Date',
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
            width: width * 0.1,
            child: const Text(
              'Total',
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
