import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import 'package:food_delivery/utils/app_colors.dart';

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
      title: _buildTitle(),
      actions: action != null ? [action!] : null,
    );
  }

  Widget _buildTitle() {
    if (title != null && subtitle != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title!.tr(),
            style: AppTextStyles.font20BlackWeight600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            subtitle!.tr(),
            style: AppTextStyles.font16BlackWeight500,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (title != null) {
      return Text(
        title!.tr(),
        style: AppTextStyles.font20BlackWeight600,
        textAlign: TextAlign.center,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
