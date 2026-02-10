import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import 'package:food_delivery/utils/app_assets.dart';

import '../../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Routes.mainPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.splashBackground, fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Container(
              color: AppColors.blackColor.withValues(alpha: 0.08),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("loading".tr(), style: AppTextStyles.splashTextStyle),
                14.h.vBox,
                CircularProgressIndicator(color: AppColors.whiteColor),
              ],
            ).paddingOnly(bottom: 60.h),
          ),
        ],
      ),
    );
  }
}
