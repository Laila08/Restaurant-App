import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  TextInputType? textInputType;
  final FocusNode? focusNode;
  String? hint;
  TextEditingController? controller;
  final VoidCallback onFieldSubmitted;
  final Function onChange;
  IconData? icon;
  final Color textColor;
  final VoidCallback onPressed;
  //final String? Function(String?) validator;
  CustomSearchField(
      {super.key, this.textInputType,
      this.hint,
        this.focusNode,
      this.controller,
     // required this.validator,
      required this.onFieldSubmitted,
      required this.icon,
      required this.onChange,
      required this.onPressed,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        cursorColor:  AppColors.primaryColor,
        keyboardType: textInputType,
        //validator: validator,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: -10, horizontal: 15),
          hintText: hint,
          hintStyle:
               TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          suffixIcon: IconButton(
            icon: Icon(
              icon,
              size: 25,
              color:  AppColors.primaryColor,
            ),
            onPressed: onPressed,
          ),

          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor,),
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
          onChange(value);
        },
        onFieldSubmitted: (_) => onFieldSubmitted(),
      ),
    );
  }
}
