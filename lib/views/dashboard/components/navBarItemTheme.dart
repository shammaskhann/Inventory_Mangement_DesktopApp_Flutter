import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/views/dashboard/components/navBarItems.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../constant/theme/app_themes.dart';

SidebarXTheme sidebarXTheme() {
  double fontSize = Get.width * 0.008; //thats equal to 14
  double iconSize = Get.width * 0.015; //thats equal to 24
  return SidebarXTheme(
    width: Get.width * 0.12, // Extended width
    height: double.infinity,
    padding: const EdgeInsets.all(0),
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: Colors.grey[900], // Dark background color
    ),
    iconTheme: IconThemeData(
      color: Colors.white, // Light icon color
      size: iconSize,
    ),
    selectedIconTheme: IconThemeData(
      color: AppTheme.selectedIconClr,
      size: iconSize,
    ),
    textStyle: TextStyle(
      color: Colors.white, // Light text color
      fontSize: fontSize,
    ),
    selectedTextStyle: TextStyle(
      color: AppTheme.selectedIconClr,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
    itemDecoration: BoxDecoration(
      color: Colors.grey[900], // Dark item background color
    ),
    selectedItemDecoration: BoxDecoration(
      color: AppTheme.grasGreenClr,
      borderRadius: BorderRadius.circular(10),
    ),
    itemMargin: const EdgeInsets.only(left: 10, right: 10),
    selectedItemMargin: const EdgeInsets.only(left: 10, right: 10),
    itemPadding: const EdgeInsets.all(10),
    selectedItemPadding: const EdgeInsets.all(10),
    itemTextPadding: const EdgeInsets.all(10),
    selectedItemTextPadding: const EdgeInsets.all(10),
    hoverColor: Colors.grey[700], // Darker hover color
    hoverTextStyle: TextStyle(
      color: Colors.white, // Light hover text color
      fontSize: fontSize,
    ),
    hoverIconTheme: IconThemeData(
      color: Colors.white, // Light hover icon color
      size: iconSize,
    ),
  );
}
