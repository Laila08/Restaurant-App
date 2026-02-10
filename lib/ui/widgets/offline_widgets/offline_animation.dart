import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_assets.dart';

class OfflineAnimation extends StatelessWidget {
  const OfflineAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(AppAssets.homeImage, fit: BoxFit.cover);
  }
}
