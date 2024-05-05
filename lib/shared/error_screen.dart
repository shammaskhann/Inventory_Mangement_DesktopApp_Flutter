import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.darkThemeBackgroudClr,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error,
                size: 100,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              const Text(
                'Error',
                style: TextStyle(
                    fontFamily: 'MyraidPro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
              const SizedBox(height: 15),
              const Text(
                'An error occurred while establishing connection with database',
                style: TextStyle(
                    fontFamily: 'MyraidPro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
              TextButton(
                  onPressed: () {
                    Get.offAllNamed(PageName.splash_screen);
                  },
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        fontFamily: 'MyraidPro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.red),
                  ))
            ],
          ),
        ));
  }
}
