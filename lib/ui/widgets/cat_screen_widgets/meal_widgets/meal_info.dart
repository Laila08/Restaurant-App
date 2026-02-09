import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

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
            style: AppTextStyles.font16BlackWeight500,
          ),
        ),
        5.hBox,
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: AppTextStyles.font17PrimaryWeight600,
        ),
      ],
    );
  }
}
