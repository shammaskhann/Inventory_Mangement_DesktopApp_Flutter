import 'package:flutter/material.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';

class CustomDailogDetailWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final Widget? iconButton;
  const CustomDailogDetailWidget(
      {this.title, this.value, super.key, this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            color: AppTheme.darkThemeBackgroudClr,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value ?? '',
              style: TextStyle(
                color: (value == 'Paid' || value == 'Delivered')
                    ? Colors.green
                    : (value == 'Pending' ||
                            value == 'In Transit' ||
                            value == 'Pending Pickup')
                        ? Colors.yellow
                        : (value == 'Cancelled')
                            ? Colors.red
                            : AppTheme.darkThemeBackgroudClr,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (iconButton != null) iconButton!,
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
