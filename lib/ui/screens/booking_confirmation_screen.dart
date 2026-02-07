import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/booking_model.dart';
import 'package:food_delivery/utils/app_colors.dart';

import '../widgets/booking_confirmation_widgets/booking_details_card.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final BookingModel booking;
  const BookingConfirmationScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("confirm_booking".tr()),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: BookingDetailsCard(booking: booking),
      ),
    );
  }
}