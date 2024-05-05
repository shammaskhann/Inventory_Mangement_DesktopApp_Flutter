import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/icons/app_icons.dart';

import '../../../constant/theme/app_themes.dart';

Widget navBarHeader() {
  return Container(
    height: Get.height * 0.06,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.splashLogo,
            height: 30,
            width: 30,
            color: AppTheme.grasGreenClr,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Dashboard',
            style: TextStyle(
              fontFamily: 'MyraidPro',
              color: AppTheme.grasGreenClr,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
