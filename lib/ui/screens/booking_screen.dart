import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/models/booking_model.dart';
import 'package:food_delivery/utils/app_colors.dart';

import '../../controller/booking/booking_cubit.dart';
import '../../controller/cart_cubit/cart_cubit.dart';
import '../../utils/constants.dart';
import 'booking_confirmation_screen.dart';

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

  void _confirmBooking() async{
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your phone number")),
      );
      return;
    }
    final orderNumber = await context.read<BookingCubit>()
        .bookingServicesImp
        .getNextOrderNumber(storeId: "default_store");
    final booking = BookingModel(
      id: documentIdFromLocalData(),
      phone: phone,
      totalPrice: widget.total.toInt(),
      pickupAfterMinutes: 30,
      status: "pending",
      orderNumber: orderNumber,
    );
    // انتقل لصفحة تأكيد الحجز مع إرسال البيانات
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(
              value: context.read<BookingCubit>(),
              child: BookingConfirmationScreen(booking: booking),
            ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Total: \$${widget.total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 30),
            BlocConsumer<BookingCubit, BookingState>(
              listener: (context, state) {
                if (state is BookingSuccess) {
                  context.read<CartCubit>().clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Booking confirmed!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context); // ارجع لصفحة الكارت بعد الحجز
                } else if (state is BookingFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Error: ${state.error}"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is BookingLoading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: _confirmBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(
                    "Confirm Booking",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
