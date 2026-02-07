import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class MealInfo extends StatelessWidget {
  final String name;
  final double price;

  const MealInfo({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}