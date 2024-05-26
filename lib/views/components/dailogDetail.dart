import 'package:flutter/material.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';

class DailogDetailWidget extends StatelessWidget {
  final String? title;
  final String? value;
  const DailogDetailWidget({this.title, this.value, super.key});

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
        Text(
          value ?? '',
          style: const TextStyle(
            color: AppTheme.darkThemeBackgroudClr,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
