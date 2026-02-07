import 'package:flutter/material.dart';
import '../../../../extensions/app_extensions.dart';
import '../../../../utils/app_assets.dart';

class CategoryAppBarBackground extends StatelessWidget {
  final double height;
  final Widget child;

  const CategoryAppBarBackground({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            AppAssets.categoryBackground,
            width: context.width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
