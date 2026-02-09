import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/controller/cart_cubit/cart_cubit.dart';
import 'package:food_delivery/controller/meal_cubit/meal_cubit.dart';
import 'package:food_delivery/controller/meal_detail_cubit/meal_detail_cubit.dart';
import 'app/delivery_app.dart';
import 'controller/category_cubit/category_cubit.dart';
import 'controller/search_cubit/search_cubit.dart';
import 'data/repos/category_repo.dart';
import 'data/repos/meals_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  final mealsRepo = MealsRepo();
  final categoryRepo = CategoryRepo();

  final mealCubit = MealCubit(mealsRepo);
  final mealDetailCubit = MealDetailCubit(mealsRepo);
  final cartCubit = CartCubit();
  final categoryCubit = CategoryCubit(categoryRepo)..getCategoryData();
  final searchCubit = SearchCubit(mealsRepo);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),

      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: mealCubit),
          BlocProvider.value(value: mealDetailCubit),
          BlocProvider.value(value: cartCubit),
          BlocProvider.value(value: categoryCubit),
          BlocProvider.value(value: searchCubit),
        ],
        child: DeliveryApp(),
      ),
    ),
  );
}
