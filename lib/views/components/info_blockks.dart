import 'package:flutter/material.dart';
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
        width: Get.width * 0.1,
        decoration: BoxDecoration(
          color: AppTheme.secondaryClr,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: avatarBackgroundColor,
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.lightGreyClr),
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.lightGreyClr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
