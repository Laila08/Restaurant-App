import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/models/booking_model.dart';
import 'package:food_delivery/services/booking_services.dart';
import 'package:meta/meta.dart';

import '../../utils/constants.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  final bookingServicesImp = BookingServicesImp();

  Future<void> createBooking(BookingModel bookingModel)async{
    emit(BookingLoading());
    try {
      final newBooking = BookingModel(
        id: bookingModel.id, // نفس ال ID اللي انبعت من BookingScreen
        phone: bookingModel.phone,
        totalPrice: bookingModel.totalPrice,
        pickupAfterMinutes: bookingModel.pickupAfterMinutes,
        status: bookingModel.status,
        createdAt: Timestamp.now(),
        orderNumber: bookingModel.orderNumber, // نفس الرقم اللي انبعت
      );
      await bookingServicesImp.createBooking(newBooking);
      emit(BookingSuccess(newBooking));
    } on Exception catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }
  Future<void> confirmBooking(String phone, double total) async {
    emit(BookingLoading());
    try {
      final orderNumber = await bookingServicesImp.getNextOrderNumber(storeId: "default_store");
      final booking = BookingModel(
        id: documentIdFromLocalData(),
        phone: phone,
        totalPrice: total.toInt(),
        pickupAfterMinutes: 30,
        status: "pending",
        orderNumber: orderNumber,
      );
      emit(BookingSuccess(booking));
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }

}
