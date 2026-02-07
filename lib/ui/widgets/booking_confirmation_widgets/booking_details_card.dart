import 'package:flutter/material.dart';
import '../../../data/models/booking_model.dart';
import '../../../extensions/app_extensions.dart';
import '../../../utils/app_colors.dart';
import 'booking_details_list.dart';

class BookingDetailsCard extends StatelessWidget {
  final BookingModel booking;
  const BookingDetailsCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 20.paddingAll,
      padding: 20.paddingAll,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.4),
            blurRadius: 15,
            offset: const Offset(0,5),
          ),
        ],
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: BookingDetailsList(booking: booking),
    );
  }
}
