import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  final String? text;
  final double? width;
  final double height;
  final TextStyle? style;
  final bool isLoading;
  final TextAlign? textAlign;
  final int? noOfMaxLines;
  const ShimmerText({
    super.key,
    this.text,
    this.width,
    required this.height,
    this.style,
    required this.isLoading,
    this.textAlign,
    this.noOfMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: AppColors.gray300,
        highlightColor: AppColors.gray100,
        child: Container(
          width: width ?? double.infinity,
          height: height,
          color: AppColors.gray300,
        ),
      );
    }
    return Text(
      text ?? '',
      style: style,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: noOfMaxLines,
    );
  }
}
