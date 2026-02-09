import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import '../../../controller/booking/booking_cubit.dart';
import '../../../controller/cart_cubit/cart_cubit.dart';
import '../../../data/models/booking_model.dart';
import '../../../extensions/app_extensions.dart';
import '../../../utils/app_colors.dart';
import '../app_button.dart';
import 'booking_detail_row.dart';
import 'package:easy_localization/easy_localization.dart';

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
        BlocConsumer<BookingCubit, BookingState>(
          listenWhen: (previous, current) =>
          current is BookingSuccess || current is BookingFailure,
          listener: (context, state) {
            if (state is BookingSuccess) {
              context.read<CartCubit>().clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("booking_confirmed".tr()),
                  backgroundColor: AppColors.primaryColor,
                ),
              );
              Navigator.popUntil(context, (route) => route.isFirst);
            } else if (state is BookingFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("error_generic".tr(args: [state.error])),
                  backgroundColor: AppColors.errorColor,
                ),
              );
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
        ),
      ],
    );
  }
}
