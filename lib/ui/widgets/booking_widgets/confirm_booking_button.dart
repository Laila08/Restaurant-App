import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/booking/booking_cubit.dart';
import '../../../utils/app_colors.dart';
import '../../screens/booking_confirmation_screen.dart';
import '../app_button.dart';

class ConfirmBookingButton extends StatelessWidget {
  final TextEditingController phoneController;
  final double total;

  const ConfirmBookingButton({super.key, required this.phoneController, required this.total});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<BookingCubit>(),
                child: BookingConfirmationScreen(booking: state.bookingModel),
              ),
            ),
          );
        } else if (state is BookingFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: AppColors.errorColor,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is BookingLoading;
        return AppButton(
          text: "confirm_booking".tr(),
          isLoading: isLoading,
          onTap: () {
            final phone = phoneController.text.trim();
            if (phone.isNotEmpty) {
              context.read<BookingCubit>().confirmBooking(phone, total);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("enter_phone".tr()),
                  backgroundColor: AppColors.errorColor,
                ),
              );
            }
          },
        );
      },
    );
  }
}
