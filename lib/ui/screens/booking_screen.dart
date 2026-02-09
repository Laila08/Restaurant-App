import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../extensions/app_extensions.dart';
import '../widgets/booking_widgets/confirm_booking_button.dart';
import '../widgets/booking_widgets/phone_input_field.dart';
import '../widgets/booking_widgets/total_display.dart';
import '../widgets/custom_app_bar.dart';

class BookingScreen extends StatefulWidget {
  final double total;
  const BookingScreen({super.key, required this.total});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "booking".tr(), showBackButton: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TotalDisplay(total: widget.total),
            30.h.vBox,
            PhoneInputField(controller: _phoneController),
            30.h.vBox,
            ConfirmBookingButton(
              phoneController: _phoneController,
              total: widget.total,
            ),
          ],
        ).paddingAll(20.w),
      ),
    );
  }
}
