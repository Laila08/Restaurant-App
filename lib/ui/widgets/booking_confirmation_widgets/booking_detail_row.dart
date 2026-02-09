import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

import '../../../extensions/app_extensions.dart';

class BookingDetailRow extends StatelessWidget {
  final String title;
  final String value;
  const BookingDetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "$title:",
            style:AppTextStyles.font16Weight500,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(value, style:AppTextStyles.font16Weight500,),
        ),
      ],
    ).paddingV(5.h);
  }
}
