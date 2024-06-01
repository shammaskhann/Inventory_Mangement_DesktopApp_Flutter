import 'package:flutter/material.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';

Widget actionButton(String text, bool loading, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.kPrimaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.kPrimaryColor.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: (loading)
            ? LoadingIndicator(
                isWhiteClr: true,
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    ),
  );
}
