import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

enum SnackBarType { success, error, info }

class SnackBarHelper {
  static void show(
    BuildContext context,
    String message, {
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    Color backgroundColor;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppColors.primaryColor;
        break;
      case SnackBarType.error:
        backgroundColor = AppColors.errorColor;
        break;
      case SnackBarType.info:
        backgroundColor = AppColors.gray400;
        break;
    }

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
