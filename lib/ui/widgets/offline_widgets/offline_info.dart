import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_text_styles.dart';

class OfflineInfo extends StatelessWidget {
  const OfflineInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "noInternetConnectionInfo".tr(),
      textAlign: TextAlign.center,
      style: AppTextStyles.font17BlackWeight400,
    );
  }
}
