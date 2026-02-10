import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/booking/booking_cubit.dart';
import '../../../utils/app_colors.dart';
import '../../screens/booking_confirmation_screen.dart';
import '../snackbar_helper.dart';

class ConfirmBookingListener {
  static void handleState(
    BuildContext context,
    BookingState state,
    BookingCubit bookingCubit,
  ) {
    if (state is BookingSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: bookingCubit,
            child: BookingConfirmationScreen(booking: state.bookingModel),
          ),
        ),
      );
    } else if (state is BookingFailure) {
      SnackBarHelper.show(context, state.error, type: SnackBarType.error);
    }
  }
}
