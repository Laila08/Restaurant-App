import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/booking/booking_cubit.dart';
import '../../../controller/cart_cubit/cart_cubit.dart';
import '../../../data/models/booking_model.dart';
import '../../../utils/app_colors.dart';
import '../app_button.dart';
import 'package:easy_localization/easy_localization.dart';

import '../snackbar_helper.dart';

class BookingConfirmButton extends StatelessWidget {
  final BookingModel booking;
  const BookingConfirmButton({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listenWhen: (previous, current) =>
          current is BookingSuccess || current is BookingFailure,
      listener: (context, state) {
        if (state is BookingSuccess) {
          context.read<CartCubit>().clearCart();
          SnackBarHelper.show(context, "booking_confirmed".tr(), type: SnackBarType.success);
          Navigator.popUntil(context, (route) => route.isFirst);
        } else if (state is BookingFailure) {
          SnackBarHelper.show(context, "error_generic".tr(args: [state.error]), type: SnackBarType.error);
        }
      },
      buildWhen: (previous, current) =>
          current is BookingSuccess || current is BookingLoading,
      builder: (context, state) {
        final isLoading = state is BookingLoading;
        return Center(
          child: AppButton(
            text: "confirm_booking".tr(),
            isLoading: isLoading,
            onTap: () {
              context.read<BookingCubit>().createBooking(booking);
            },
          ),
        );
      },
    );
  }
}
