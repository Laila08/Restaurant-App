import 'package:flutter/material.dart';

import '../../extensions/app_extensions.dart';
import '../../theme/app_text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const AppBarTitle({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    if (title != null && subtitle != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title!,
            style: AppTextStyles.font20BlackWeight600,
            textAlign: TextAlign.center,
          ),
          8.hBox,
          Text(
            subtitle!,
            style: AppTextStyles.font16BlackWeight500,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (title != null) {
      return Text(
        title!,
        style: AppTextStyles.font20BlackWeight600,
        textAlign: TextAlign.center,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
