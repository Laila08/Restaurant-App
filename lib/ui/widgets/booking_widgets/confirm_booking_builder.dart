import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../controller/booking/booking_cubit.dart';
import '../../../utils/app_colors.dart';
import '../app_button.dart';
import '../snackbar_helper.dart';

class ConfirmBookingBuilder {
  static Widget buildButton(
    BuildContext context,
    BookingState state,
    TextEditingController phoneController,
    double total,
    BookingCubit bookingCubit,
  ) {
    final isLoading = state is BookingLoading;
    return AppButton(
      text: "confirm_booking".tr(),
      isLoading: isLoading,
      onTap: () {
        final phone = phoneController.text.trim();
        if (phone.isNotEmpty) {
          bookingCubit.confirmBooking(phone, total);
        } else {
          SnackBarHelper.show(context, "enter_phone".tr(), type: SnackBarType.error);
        }
      },
    );
  }
}
