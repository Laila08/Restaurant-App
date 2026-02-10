import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/booking/booking_cubit.dart';
import 'confirm_booking_listener.dart';
import 'confirm_booking_builder.dart';

class ConfirmBookingButton extends StatelessWidget {
  final TextEditingController phoneController;
  final double total;

  const ConfirmBookingButton({
    super.key,
    required this.phoneController,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final bookingCubit = context.read<BookingCubit>();

    return BlocConsumer<BookingCubit, BookingState>(
      listenWhen: (previous, current) =>
          current is BookingSuccess || current is BookingFailure,
      listener: (context, state) =>
          ConfirmBookingListener.handleState(context, state, bookingCubit),
      buildWhen: (previous, current) =>
          current is BookingLoading || current is BookingSuccess,
      builder: (context, state) => ConfirmBookingBuilder.buildButton(
        context,
        state,
        phoneController,
        total,
        bookingCubit,
      ),
    );
  }
}
