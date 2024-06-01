import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/icons/app_icons.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/Merchant/Invoices/invoices_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/customers/customer_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/dashboard/components/navBarHeader.dart';
import 'package:shopify_admin_dashboard/views/Merchant/dashboard/components/navBarItemTheme.dart';
import 'package:shopify_admin_dashboard/views/Merchant/dashboard/components/navBarItems.dart';
import 'package:shopify_admin_dashboard/views/Merchant/dashboard/controller/dashboard_controller.dart';
import 'package:shopify_admin_dashboard/views/Merchant/discount/discount_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/home/home_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/inventory/inventory_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/orders/controller/order_controller.dart';
import 'package:shopify_admin_dashboard/views/Merchant/orders/order_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/purchase%20order/purchase_order_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/sales_channel/saleschaneel_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/shippers/shipper_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/vendors/supplier_screen.dart';
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
              footerDivider: Container(
                height: 8,
                color: AppTheme.darkThemeBackgroudClr,
              ),
              showToggleButton: true,
              headerBuilder: (context, extended) {
                return extended ? navBarHeader() : nonExtendedNavBarHeader();
              },
              // headerDivider: navBarHeader(),
              theme: nonExtendedSidebarXTheme(),
              extendedTheme: sidebarXTheme(),
              controller: SidebarXController(
                selectedIndex: dashboardController.currentIndex.value,
                // extended: true,
              ),
              items: navBarItems,
            ),
            Expanded(
              child: Obx(() {
                if (dashboardController.currentIndex.value == 9) {
                  Future.microtask(() => Get.toNamed(PageName.auth_screen));
                  return Container(); // return an empty container or some other widget
                }
                switch (dashboardController.currentIndex.value) {
                  case 0:
                    return const HomeScreen();
                  case 1:
                    return const OrderScreen();
                  case 2:
                    return const InventoryScreen();
                  case 3:
                    return const PurchaseOrderScreen();
                  case 4:
                    return const SupplierScreen();
                  case 5:
                    return const SalesChannelScreen();
                  case 6:
                    return const CustomerScreen();
                  case 7:
                    return const ShipperScreen();
                  case 8:
                    return const DiscountScreen();
                  default:
                    return LoadingIndicator();
                }
              }),
            ),
          ],
        ));
  }
}
