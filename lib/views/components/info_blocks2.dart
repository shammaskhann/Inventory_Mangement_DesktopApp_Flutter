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
        height: Get.height * 0.08,
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
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.whiteselClr)),
              const Divider(
                color: AppTheme.lightGreyClr,
                endIndent: 40,
              ),
              Row(
                children: [
                  const SizedBox(width: 5),
                  Text(value.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.whiteselClr)),
                  const SizedBox(width: 5),
                  if (isGreaterThanLastWeek) ...[
                    const Icon(
                      Icons.arrow_drop_up,
                      color: AppTheme.grasGreenClr,
                    ),
                    Text('${percValue!.toStringAsFixed(2)}%',
                        style: const TextStyle(
                            fontSize: 14,
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
