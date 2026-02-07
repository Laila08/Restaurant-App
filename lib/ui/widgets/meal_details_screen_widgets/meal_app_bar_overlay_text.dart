import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MealAppBarOverlayText extends StatelessWidget {
  const MealAppBarOverlayText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Text(
          'about_this_menu'.tr(),
          style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}