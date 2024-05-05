import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../constant/theme/app_themes.dart';

SidebarXTheme sidebarXTheme() {
  return SidebarXTheme(
    width: Get.width * 0.12, // Extended width
    height: double.infinity,
    padding: const EdgeInsets.all(0),
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: Colors.grey[900], // Dark background color
    ),
    iconTheme: const IconThemeData(
      color: Colors.white, // Light icon color
      size: 24,
    ),
    selectedIconTheme: const IconThemeData(
      color: AppTheme.selectedIconClr,
      size: 24,
    ),
    textStyle: const TextStyle(
      color: Colors.white, // Light text color
      fontSize: 14,
    ),
    selectedTextStyle: const TextStyle(
      color: AppTheme.selectedIconClr,
      fontSize: 14,
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
    hoverTextStyle: const TextStyle(
      color: Colors.white, // Light hover text color
      fontSize: 14,
    ),
    hoverIconTheme: const IconThemeData(
      color: Colors.white, // Light hover icon color
      size: 24,
    ),
  );
}
