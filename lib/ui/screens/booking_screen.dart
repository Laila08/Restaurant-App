import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../extensions/app_extensions.dart';
import '../../utils/app_colors.dart';
import '../widgets/booking_widgets/confirm_booking_button.dart';
import '../widgets/booking_widgets/phone_input_field.dart';
import '../widgets/booking_widgets/total_display.dart';

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
      appBar: AppBar(title: Text("booking".tr()), backgroundColor: AppColors.primaryColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TotalDisplay(total: widget.total),
              30.vBox,
              PhoneInputField(controller: _phoneController),
              30.vBox,
              ConfirmBookingButton(phoneController: _phoneController, total: widget.total),
            ],
          ),
        ),
      ),
    );
  }
}
