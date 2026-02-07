import 'package:flutter/material.dart';

import 'circle_icon.dart';

class MealAppBarBackButton extends StatelessWidget {
  const MealAppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: CircleIcon(
        icon: Icons.arrow_back_ios,
        onTap: () => Navigator.pop(context),
        color: Colors.white,
      ),
    );
  }
}