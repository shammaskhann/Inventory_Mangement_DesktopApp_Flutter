import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/icons/app_icons.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppTheme.appBarClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppIcons.splashLogo,
              width: Get.width * 0.4,
              height: Get.height * 0.4,
              color: AppTheme.secondaryClr,
            ),
            const SizedBox(height: 20),
            const Text('ElectroStock',
                style: TextStyle(
                    fontFamily: 'NicoMoji',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: AppTheme.oliverGreenClr)),
            const SizedBox(height: 15),
            const LoadingIndicator(),
            AnimatedTextKit(
              animatedTexts: [
                // TyperAnimatedText(
                //   "Checking Internet Connection...",
                //   textStyle: const TextStyle(
                //       fontSize: 20.0,
                //       fontFamily: "MyriadPro",
                //       color: AppTheme.oliverGreenClr),
                //   speed: const Duration(milliseconds: 10),
                // ),
                TyperAnimatedText("Establishing connection with database...",
                    textStyle: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: "MyriadPro",
                        color: AppTheme.oliverGreenClr),
                    speed: const Duration(milliseconds: 20)),
                TyperAnimatedText(
                    "Please wait while we set things up for you...",
                    textStyle: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: "MyriadPro",
                        color: AppTheme.oliverGreenClr),
                    speed: const Duration(milliseconds: 20)),
              ],
              isRepeatingAnimation: true,
            ),
          ],
        ),
      ),
    );
  }
}
