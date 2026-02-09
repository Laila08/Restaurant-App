part of 'booking_cubit.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSuccess extends BookingState {
  final BookingModel bookingModel;
  BookingSuccess(this.bookingModel);
}

final class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}
