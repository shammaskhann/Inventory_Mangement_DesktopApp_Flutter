import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';

class InfoBlock2 extends StatelessWidget {
  final String title;
  final int value;
  final bool isGreaterThanLastWeek;
  final double? percValue;
  const InfoBlock2(
      {Key? key,
      required this.title,
      required this.value,
      required this.isGreaterThanLastWeek,
      this.percValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: Get.height * 0.1,
        width: Get.width * 0.1,
        decoration: BoxDecoration(
          color: AppTheme.lightGreyClr.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: Get.height * 0.015,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.whiteselClr)),
              Divider(
                color: AppTheme.lightGreyClr,
                endIndent: Get.width * 0.01,
              ),
              Row(
                children: [
                  const SizedBox(width: 5),
                  Text(value.toString(),
                      style: TextStyle(
                          fontSize: Get.height * 0.02,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.whiteselClr)),
                  const SizedBox(width: 5),
                  if (isGreaterThanLastWeek) ...[
                    Icon(
                      Icons.arrow_drop_up,
                      color: AppTheme.grasGreenClr,
                      size: Get.height * 0.02,
                    ),
                    Text('${percValue!.toStringAsFixed(2)}%',
                        style: TextStyle(
                            fontSize: Get.height * 0.015,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.grasGreenClr)),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
