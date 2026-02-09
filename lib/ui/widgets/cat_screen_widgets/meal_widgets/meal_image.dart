import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

class MealImage extends StatelessWidget {
  final String imageUrl;

  const MealImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: 15.r.radiusAll,
      child: Image.network(
        imageUrl,
        height: 130.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.broken_image, size: 60.sp),
      ),
    );
  }
}
