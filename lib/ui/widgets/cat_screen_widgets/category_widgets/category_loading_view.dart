import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/ui/widgets/cat_screen_widgets/category_widgets/horizontal_category_shimmer.dart';
import '../../../../theme/app_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

class CategoryLoadingView extends StatelessWidget {
  const CategoryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "find_by_category".tr(),
          style: AppTextStyles.font17PrimaryWeight600,
        ).paddingV(10),
        SizedBox(height: 100.h, child: const HorizontalCategoryShimmer()),
      ],
    ).paddingH(15.w).paddingV(5.h);
  }
}
