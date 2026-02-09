import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import '../../../../utils/app_colors.dart';

class CartItemImage extends StatelessWidget {
  final String? imageUrl;

  const CartItemImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: 15.r.radiusAll,
        color: AppColors.primaryColor.withAlpha(80),
      ),
      child: ClipRRect(
        borderRadius: 15.r.radiusAll,
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(imageUrl!, fit: BoxFit.cover)
            : Container(color: AppColors.grayOpacity),
      ),
    );
  }
}
