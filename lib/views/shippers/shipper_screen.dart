import 'package:flutter/material.dart';
import 'package:shopify_admin_dashboard/views/shippers/controller/shipper_controller.dart';
import 'package:get/get.dart';
import '../../constant/theme/app_themes.dart';
import '../components/CustomButton.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShipperScreen extends StatelessWidget {
  const ShipperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShipperController shipperController = Get.put(ShipperController());
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Shippers',
              style: TextStyle(
                color: AppTheme.whiteselClr,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
