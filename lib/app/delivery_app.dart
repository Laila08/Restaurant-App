import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/constants.dart';

import '../routes/app_router.dart';
import '../routes/routes.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppConstants.appWidth, AppConstants.appHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.whiteColor),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.splash,
      ),
    );
  }
}
