import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/icons/app_icons.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/dashboard/components/navBarHeader.dart';
import 'package:shopify_admin_dashboard/views/dashboard/components/navBarItemTheme.dart';
import 'package:shopify_admin_dashboard/views/dashboard/components/navBarItems.dart';
import 'package:shopify_admin_dashboard/views/dashboard/controller/dashboard_controller.dart';
import 'package:shopify_admin_dashboard/views/home/home_screen.dart';
import 'package:shopify_admin_dashboard/views/inventory/inventory_screen.dart';
import 'package:shopify_admin_dashboard/views/orders/order_screen.dart';
import 'package:shopify_admin_dashboard/views/purchase%20order/purchase_order_screen.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());

    return Scaffold(
        backgroundColor: AppTheme.darkThemeBackgroudClr,
        body: Row(
          children: [
            SidebarX(
              showToggleButton: false,
              headerDivider: navBarHeader(),
              extendedTheme: sidebarXTheme(),
              controller: SidebarXController(
                  selectedIndex: dashboardController.currentIndex.value,
                  extended: true),
              items: navBarItems,
            ),
            Expanded(
              child: Obx(() {
                switch (dashboardController.currentIndex.value) {
                  case 0:
                    return const HomeScreen();
                  case 1:
                    return const OrderScreen();
                  case 2:
                    return const InventoryScreen();
                  case 3:
                    return const LoadingIndicator();
                  case 4:
                    return const PurchaseOrderScreen();
                  default:
                    return LoadingIndicator();
                }
              }),
            ),
          ],
        ));
  }
}
