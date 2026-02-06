import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.dart';
import '../routes/routes.dart';
import '../ui/screens/home.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.mainPage,
    );
  }
}
