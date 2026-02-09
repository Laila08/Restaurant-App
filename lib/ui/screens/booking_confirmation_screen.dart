import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/booking_model.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

import '../widgets/booking_confirmation_widgets/booking_details_card.dart';
import '../widgets/custom_app_bar.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final BookingModel booking;
  const BookingConfirmationScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
      title: "confirm_booking".tr(),
      showBackButton: true,
    ),
      body: BookingDetailsCard(booking: booking).centered(),
    );
  }
}
