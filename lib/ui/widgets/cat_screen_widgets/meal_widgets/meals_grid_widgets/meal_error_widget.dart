import 'package:flutter/material.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

class MealErrorWidget extends StatelessWidget {
  final String error;
  const MealErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Text(error).centered();
  }
}
