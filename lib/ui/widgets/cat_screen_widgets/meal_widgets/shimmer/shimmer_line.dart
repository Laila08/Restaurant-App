import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../extensions/app_extensions.dart';
import '../../../../../utils/app_colors.dart';

class ShimmerLine extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerLine({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: 6.r.radiusAll,
        gradient: LinearGradient(
          colors: [AppColors.gray400, AppColors.gray200],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    ).paddingH(8.w);
  }
}
