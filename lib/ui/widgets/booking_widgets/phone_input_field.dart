import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../custom_search_field.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomSearchField(
      controller: controller,
      textInputType: TextInputType.phone,
      hint: "Phone_Number",
      icon: Icons.phone,
      textColor: AppColors.blackColor,
      onFieldSubmitted: () {},
      onChange: (value) {},
      onPressed: () {},
      focusNode: null,
    );
  }
}
