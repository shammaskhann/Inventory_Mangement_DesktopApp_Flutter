import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget icon;
  bool loading = false;
  CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: Get.width * 0.13,
        decoration: BoxDecoration(
          color: AppTheme.grasGreenClr,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppTheme.appBarClr.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: (loading)
            ? Center(
                child: LoadingIndicator(isWhiteClr: true),
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 5),
                    icon,
                  ],
                ),
              ),
      ),
    );
  }
}
