import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_text_styles.dart';

class TotalDisplay extends StatelessWidget {
  final double total;
  const TotalDisplay({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.font22PrimaryWeight600,
        children: [
          TextSpan(text: "Total".tr()),
          TextSpan(
            text: " \$$total",
            style: AppTextStyles.font20BlackWeight600,
          ),
        ],
      ),
    );
  }
}
