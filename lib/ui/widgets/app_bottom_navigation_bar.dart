import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: AppColors.whiteColor,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInBack,
      color: AppColors.blackColor,
      buttonBackgroundColor: AppColors.primaryColor,
      height: 50.h,
      index: currentIndex,
      onTap: onTap,
      items: const [
        Icon(Icons.home, color: AppColors.whiteColor),
        Icon(Icons.shopping_cart_outlined, color: AppColors.whiteColor),
        Icon(Icons.person, color: AppColors.whiteColor),
      ],
    );
  }
}
