part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final BookingModel bookingModel;
  BookingSuccess(this.bookingModel);
}

class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}
