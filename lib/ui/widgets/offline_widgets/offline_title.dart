import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_text_styles.dart';

class OfflineTitle extends StatelessWidget {
  const OfflineTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("oops".tr(), style: AppTextStyles.internetTextStyle);
  }
}