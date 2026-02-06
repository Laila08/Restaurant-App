import 'package:flutter/material.dart';

class CategoryAppBarBackground extends StatelessWidget {
  final double height;
  final Widget child;

  const CategoryAppBarBackground({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/2746c772f3f577334eeee82bd86e6ff8c43c3075.png',
            width: double.infinity,
            fit: BoxFit.cover,
            height: height,
          ),
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }
}
