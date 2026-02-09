import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/restaurant_about_widgets/restaurant_icon_widget.dart';
import '../widgets/restaurant_about_widgets/restaurant_info_card.dart';

class RestaurantAboutScreen extends StatelessWidget {
  const RestaurantAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "about_restaurant_title",
        showBackButton: false,
        action: IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            if (context.locale.languageCode == 'en') {
              context.setLocale(const Locale('ar'));
            } else {
              context.setLocale(const Locale('en'));
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: 20.w.paddingAll,
        child: Column(
          children: [
            RestaurantIconWidget(),
            20.h.vBox,
            RestaurantInfoCard(),
          ],
        ),
      ),
    );
  }
}
