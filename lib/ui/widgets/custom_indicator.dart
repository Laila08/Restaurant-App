import 'package:flutter/material.dart';
class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer (duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(70),
      color: active?Colors.white:Colors.grey,
    ),width: 17,height: 5,);
  }
}
