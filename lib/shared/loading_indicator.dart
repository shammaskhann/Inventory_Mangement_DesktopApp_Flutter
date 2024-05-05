import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/theme/app_themes.dart';

Widget loadingIndiator() {
  return const Center(
    child: SpinKitFadingCircle(
      color: AppTheme.oliverGreenClr,
      size: 50.0,
    ),
  );
}
