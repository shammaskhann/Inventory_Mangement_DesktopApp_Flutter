import 'package:flutter/material.dart';

import '../../constant/theme/app_themes.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discounts Code',
                    style: TextStyle(
                      color: AppTheme.whiteselClr,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer()
                ]),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
