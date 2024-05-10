import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constant/theme/app_themes.dart';

class InfoBlock extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String value;
  final Color avatarBackgroundColor;

  const InfoBlock({
    Key? key,
    required this.iconData,
    required this.title,
    required this.value,
    this.avatarBackgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: Container(
        height: 100,
        // width: Get.width * 0.1,
        decoration: BoxDecoration(
          color: AppTheme.secondaryClr,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircleAvatar(
                backgroundColor: avatarBackgroundColor,
                radius: Get.width * 0.015,
                child: Icon(
                  iconData,
                  color: Colors.white,
                  size: Get.width * 0.015,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                        fontSize: Get.width * 0.01,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.lightGreyClr),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: Get.width * 0.01,
                        fontWeight: FontWeight.w300,
                        color: AppTheme.lightGreyClr),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
