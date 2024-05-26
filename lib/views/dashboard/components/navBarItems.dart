import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/views/dashboard/controller/dashboard_controller.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../constant/icons/app_icons.dart';
import '../../../constant/theme/app_themes.dart';

double iconSize = Get.width * 0.015;
DashboardController dashboardController = Get.find();
List<SidebarXItem> navBarItems = [
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(0);
    },
    label: 'Home',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.homeIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.homeIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //order
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(1);
    },
    label: 'Orders',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.orderIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.orderIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //inventory
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(2);
    },
    label: 'Inventory',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.inventoryIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.inventoryIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //purchase order
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(3);
    },
    label: 'Purchase Orders',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.purchaseOrderIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.purchaseOrderIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //abondened cart
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(4);
    },
    label: 'Vendors',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.abondenedCartIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.abondenedCartIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //sale channel
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(5);
    },
    label: 'Sale Channels',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.salechannelIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.salechannelIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //customer
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(6);
    },
    label: 'Customers',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.customerIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.customerIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //marketing
  // SidebarXItem(
  //   onTap: () {
  //     dashboardController.changeIndex(7);
  //   },
  //   label: 'Invoices',
  //   iconBuilder: (selected, hovered) {
  //     return selected
  //         ? Image.asset(
  //             AppIcons.marketingIcon,
  //             height: iconSize,
  //             width: iconSize,
  //             color: AppTheme.selectedIconClr,
  //           )
  //         : Image.asset(
  //             AppIcons.marketingIcon,
  //             height: iconSize,
  //             width: iconSize,
  //             color: AppTheme.unselectedIconClr,
  //           );
  //   },
  // ),
  //mareting campaign
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(7);
    },
    label: 'Payments',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.payableAmountIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.payableAmountIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //marketing automation
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(8);
    },
    label: 'Logistics',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.trackingIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.trackingIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
  //discount
  SidebarXItem(
    onTap: () {
      dashboardController.changeIndex(9);
    },
    label: 'Discounts',
    iconBuilder: (selected, hovered) {
      return selected
          ? Image.asset(
              AppIcons.discountIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.selectedIconClr,
            )
          : Image.asset(
              AppIcons.discountIcon,
              height: iconSize,
              width: iconSize,
              color: AppTheme.unselectedIconClr,
            );
    },
  ),
];
