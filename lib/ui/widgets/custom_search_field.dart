import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

import '../../utils/app_colors.dart';

class CustomSearchField extends StatefulWidget {
  TextInputType? textInputType;
  final FocusNode? focusNode;
  String? hint;
  TextEditingController? controller;
  final VoidCallback onFieldSubmitted;
  final Function onChange;
  IconData? icon;
  final Color textColor;
  final VoidCallback onPressed;
  CustomSearchField({
    super.key,
    this.textInputType,
    this.hint,
    this.focusNode,
    this.controller,
    required this.onFieldSubmitted,
    required this.icon,
    required this.onChange,
    required this.onPressed,
    required this.textColor,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: AppColors.primaryColor,
        keyboardType: widget.textInputType,
        style: TextStyle(
          color: widget.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: -10,
            horizontal: 15,
          ),
          hintText: widget.hint?.tr(),
          hintStyle: AppTextStyles.font14blackWeight500,
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.5),
          suffixIcon: IconButton(
            icon: Icon(widget.icon, size: 25, color: AppColors.primaryColor),
            onPressed: widget.onPressed,
          ),

          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
        ),
        onChanged: (value) {
          widget.onChange(value);
        },
        onFieldSubmitted: (_) => widget.onFieldSubmitted(),
      ),
    );
  }
}
