import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/icons/app_icons.dart';

import '../../../../constant/theme/app_themes.dart';

Widget navBarHeader() {
  return Container(
    height: Get.height * 0.1,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //   AppIcons.splashLogo,
          //   height: 30,
          //   width: 30,
          //   color: AppTheme.grasGreenClr,
          // ),
          // const SizedBox(
          //   width: 5,
          // ),
          Text(
            'Electro\nStock',
            style: TextStyle(
                fontFamily: 'NicoMoji',
                color: AppTheme.grasGreenClr,
                fontSize: Get.width * 0.013,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget nonExtendedNavBarHeader() {
  return Container(
    height: Get.height * 0.1,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //   AppIcons.splashLogo,
          //   height: 30,
          //   width: 30,
          //   color: AppTheme.grasGreenClr,
          // ),
          // const SizedBox(
          //   width: 5,
          // ),
          Text(
            'ES',
            style: TextStyle(
                fontFamily: 'NicoMoji',
                color: AppTheme.grasGreenClr,
                fontSize: Get.width * 0.013,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
