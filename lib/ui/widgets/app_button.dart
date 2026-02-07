import 'package:flutter/material.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

import '../../utils/app_colors.dart';
import '../../theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onTap;

  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    super.key,
    this.text,
    this.child,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  }) : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled || isLoading || onTap == null;

    return InkWell(
      onTap: disabled ? null : onTap,
      borderRadius: 25.radiusAll,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: disabled ? 0.6 : 1,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: 14.paddingV,
          decoration: BoxDecoration(
            borderRadius: 25.radiusAll,
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.25),
                blurRadius: 8,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: isLoading
              ? const SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: Colors.white,
            ),
          )
              : (text != null
              ? Text(text!, style: AppTextStyles.font15WhiteWeight500)
              .centered()
              : child!),
        ),
      ),
    );
  }
}
