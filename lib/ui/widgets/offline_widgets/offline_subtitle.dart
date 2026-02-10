import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_text_styles.dart';

class OfflineSubtitle extends StatelessWidget {
  const OfflineSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("noInternet".tr(), style: AppTextStyles.font22BlackWeight600);
  }
}
