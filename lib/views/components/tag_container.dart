import 'package:flutter/material.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';

class CustomTagContainer extends StatelessWidget {
  final IconData? iconData;
  final String text;
  final Color iconColor;
  final Color textColor;

  const CustomTagContainer({
    Key? key,
    this.iconData,
    required this.text,
    this.iconColor = AppTheme.whiteselClr,
    this.textColor = AppTheme.whiteselClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.secondaryClr,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (iconData != null) Icon(iconData, size: 12, color: iconColor),
          if (iconData != null)
            const SizedBox(
              width: 5,
            ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
