import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../data/models/booking_model.dart';
import '../../../extensions/app_extensions.dart';
import 'booking_detail_row.dart';
import 'booking_confirm_button.dart';
import '../../../theme/app_text_styles.dart';

class BookingDetailsList extends StatelessWidget {
  final BookingModel booking;
  const BookingDetailsList({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "booking_details".tr(),
          style: AppTextStyles.font22PrimaryWeight600,
        ).centered(),
        20.h.vBox,
        BookingDetailRow(
          title: "order_number".tr(),
          value: booking.orderNumber,
        ),
        BookingDetailRow(title: "phone".tr(), value: booking.phone),
        BookingDetailRow(title: "total".tr(), value: "\$${booking.totalPrice}"),
        BookingDetailRow(
          title: "pickup_in".tr(),
          value: "${booking.pickupAfterMinutes} mins",
        ),
        BookingDetailRow(title: "status".tr(), value: booking.status),
        30.h.vBox,
        BookingConfirmButton(booking: booking),
      ],
    );
  }
}
