import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/app_extensions.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_messages.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(AppAssets.homeImage, fit: BoxFit.cover),
        (context.height / 30).h.vBox,
        Text(AppMessages.oops, style: AppTextStyles.internetTextStyle),
        5.vBox,
        Text(AppMessages.noInternet, style: AppTextStyles.font22BlackWeight600),
        5.h.vBox,
        Text(
          AppMessages.noInternetConnectionInfo,
          textAlign: TextAlign.center,
          style: AppTextStyles.font17BlackWeight400,
        ),
      ],
    ).centered();
  }
}
