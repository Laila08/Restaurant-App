import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

import 'app_bar_title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? action;

  const CustomAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.showBackButton = true,
    this.onBackPressed,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      elevation: 4,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackColor,
              ),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: AppBarTitle(title: title, subtitle: subtitle),
      actions: action != null ? [action!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
