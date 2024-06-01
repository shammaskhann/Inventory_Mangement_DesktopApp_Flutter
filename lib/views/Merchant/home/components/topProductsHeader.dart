import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';

class TopProductHeader extends StatelessWidget {
  const TopProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 0.07,
          child: Text(
            'SKU',
            style: TextStyle(
              color: AppTheme.whiteselClr,
              fontSize: Get.width * 0.01,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: Get.width * 0.1,
          child: Text(
            'Product Name',
            style: TextStyle(
              color: AppTheme.whiteselClr,
              fontSize: Get.width * 0.01,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: Get.width * 0.1,
          child: Text(
            'Vendor Name',
            style: TextStyle(
              color: AppTheme.whiteselClr,
              fontSize: Get.width * 0.01,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: Get.width * 0.1,
          child: Text(
            'Category',
            style: TextStyle(
              color: AppTheme.whiteselClr,
              fontSize: Get.width * 0.01,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: Get.width * 0.07,
          child: Text(
            'Quantity Sold',
            style: TextStyle(
              color: AppTheme.whiteselClr,
              fontSize: Get.width * 0.01,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
