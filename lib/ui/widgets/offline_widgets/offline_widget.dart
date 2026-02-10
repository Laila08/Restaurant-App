import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/ui/widgets/offline_widgets/offline_animation.dart';

import '../../../extensions/app_extensions.dart';
import 'offline_info.dart';
import 'offline_subtitle.dart';
import 'offline_title.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const OfflineAnimation(),
        (context.height / 30).h.vBox,
        const OfflineTitle(),
        5.vBox,
        const OfflineSubtitle(),
        5.h.vBox,
        const OfflineInfo(),
      ],
    ).centered();
  }
}
