import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/controller/booking/booking_cubit.dart';
import 'package:food_delivery/controller/search_cubit/search_cubit.dart';
import 'package:food_delivery/data/models/meal_model.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/ui/screens/all_meals_screen.dart';
import 'package:food_delivery/ui/screens/home.dart';
import 'package:food_delivery/ui/screens/meal_screen.dart';

import '../controller/category_cubit/category_cubit.dart';
import '../data/repos/category_repo.dart';
import '../ui/screens/booking_screen.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.allMeals:
        String categoryName = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (context) => AllMealsScreen(categoryName: categoryName),
          settings: settings,
        );
      case Routes.mealsDetails:
        final meal = settings.arguments as MealDetailModel;

        return CupertinoPageRoute(
          builder: (context) => MealScreen(meal: meal,),
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
      case Routes.mainPage:
        return CupertinoPageRoute(
          builder: (context) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (_) => CategoryRepo()),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                  CategoryCubit(context.read<CategoryRepo>())..getCategoryData(),
                ),
                BlocProvider(create: (_) => SearchCubit()),
              ],
              child: const Home(),
            ),
          ),
          settings: settings,
        );


      default:
        return CupertinoPageRoute(
          builder: (context) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (_) => CategoryRepo()),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                  CategoryCubit(context.read<CategoryRepo>())..getCategoryData(),
                ),
                BlocProvider(create: (_) => SearchCubit()),
              ],
              child: const Home(),
            ),
          ),
          settings: settings,
        );
    }
  }
}
