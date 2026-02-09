import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/controller/cart_cubit/cart_cubit.dart';
import 'package:food_delivery/controller/meal_cubit/meal_cubit.dart';
import 'package:food_delivery/controller/meal_detail_cubit/meal_detail_cubit.dart';
import 'app/delivery_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),

      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MealCubit()),
          BlocProvider(create: (context) => MealDetailCubit()),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: DeliveryApp(),
      ),
    ),
  );
}
