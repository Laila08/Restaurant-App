import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/controller/booking/booking_cubit.dart';
import 'package:food_delivery/data/models/meal_model.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/ui/screens/home.dart';
import 'package:food_delivery/ui/screens/meal_screen.dart';
import '../ui/screens/booking_screen.dart';
import '../ui/screens/splash_screen.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mealsDetails:
        final meal = settings.arguments as MealDetailModel;

        return CupertinoPageRoute(
          builder: (context) => MealScreen(meal: meal),
          settings: settings,
        );
      case Routes.booking:
        final price = settings.arguments as double;
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BookingCubit(),
            child: BookingScreen(total: price),
          ),
          settings: settings,
        );
      case Routes.splash:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case Routes.mainPage:
        return CupertinoPageRoute(
          builder: (context) => const Home(),
          settings: settings,
        );

      default:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
