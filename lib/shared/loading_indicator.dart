import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/theme/app_themes.dart';

class LoadingIndicator extends StatelessWidget {
  bool isWhiteClr = false;
  LoadingIndicator({this.isWhiteClr = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: (isWhiteClr) ? AppTheme.whiteselClr : AppTheme.grasGreenClr,
        size: 50.0,
      ),
    );
  }
}
