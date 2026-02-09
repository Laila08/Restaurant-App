import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

import '../../utils/app_colors.dart';
import '../../theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onTap;
  final Color? color;
  final TextStyle? textStyle;

  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    super.key,
    this.text,
    this.child,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    this.color,
    this.textStyle,
  }) : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled || isLoading || onTap == null;
    final Color buttonColor = color ?? AppColors.primaryColor;
    final TextStyle style = textStyle ?? AppTextStyles.font15WhiteWeight500;

    return InkWell(
      onTap: disabled ? null : onTap,
      borderRadius: 25.radiusAll,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: disabled ? 0.6 : 1,
        child: Container(
          alignment: Alignment.center,
          padding: 14.paddingV,
          decoration: BoxDecoration(
            borderRadius: 25.radiusAll,
            color: buttonColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.25),
                spreadRadius: 0,
                blurRadius: 8.r,
                offset: Offset(0, 4.h),

              ),
            ],
          ),
          child: isLoading
              ? SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: AppColors.whiteColor,
                  ),
                )
              : (text != null
                    ? Text(
                        text!,
                        style:style,
                      ).centered()
                    : child!),
        ),
      ),
    );
  }
}
