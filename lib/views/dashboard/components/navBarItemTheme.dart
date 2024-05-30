import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/views/dashboard/components/navBarItems.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../constant/theme/app_themes.dart';

SidebarXTheme sidebarXTheme() {
  double fontSize = Get.width * 0.0075; //thats equal to 14
  double unselfontSize = Get.width * 0.007; //thats equal to 14
  double iconSize = Get.width * 0.009; //thats equal to 24
  double unselIconSize = Get.width * 0.0075; //thats equal to 24
  return SidebarXTheme(
    width: Get.width * 0.12, // Extended width
    height: double.infinity,
    padding: const EdgeInsets.all(0),
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: Colors.grey[900],
    ),
    iconTheme: IconThemeData(
      color: Colors.white, // Light icon color
      size: iconSize,
    ),
    selectedIconTheme: IconThemeData(
      color: Colors.white, // Light icon color
      size: iconSize,
    ),
    textStyle: TextStyle(
      color: Colors.white, // Light text color
      fontSize: unselfontSize,
    ),
    selectedTextStyle: TextStyle(
      color: AppTheme.selectedIconClr,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
    itemDecoration: BoxDecoration(
      // color: Colors.grey[900], // Dark item background color
      color: Colors.grey[800], // Dark item background color
      borderRadius: BorderRadius.circular(10),
    ),
    selectedItemDecoration: BoxDecoration(
      color: AppTheme.grasGreenClr,
      borderRadius: BorderRadius.circular(10),
    ),
    itemMargin: const EdgeInsets.only(left: 10, right: 10, top: 5),
    selectedItemMargin: const EdgeInsets.only(left: 10, right: 10),
    itemPadding: const EdgeInsets.only(left: 10, right: 10),
    selectedItemPadding:
        const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
    itemTextPadding:
        const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    selectedItemTextPadding: const EdgeInsets.all(10),
    hoverColor: Colors.grey[800], // Darker hover color
    hoverTextStyle: TextStyle(
      color: AppTheme.grasGreenClr, // Light hover text color
      fontSize: fontSize,
    ),
    // hoverIconTheme: IconThemeData(
    //   color: AppTheme.grasGreenClr, // Light hover icon color
    //   size: iconSize * 1.2,
    // ),
  );
}

SidebarXTheme nonExtendedSidebarXTheme() {
  return SidebarXTheme(
    width: Get.width * 0.04, // Extended width
    height: double.infinity,
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.only(left: 20, top: 15, bottom: 20),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(10),
    ),
    selectedIconTheme: const IconThemeData(color: AppTheme.grasGreenClr),
  );
}
