import 'package:food_delivery/data/models/booking_model.dart';
import 'package:food_delivery/utils/api_path.dart';

import 'firestore_services.dart';

abstract class BookingServices {}

class BookingServicesImp implements BookingServices {
  final instance = FirestoreServices.instance;

  Future<void> createBooking(BookingModel bookingModel) async {
    await instance.setData(
      path: ApiPath.bookingDoc(bookingModel.id!),
      data: bookingModel.toMap(),
    );
  }

  Future<BookingModel> fetchPendingOrders(String id) async {
    final bookingList = await instance.getDocument(
      path: ApiPath.bookingDoc(id),
      builder: (data, documentID) => BookingModel.fromMap(data, documentID),
    );
    return bookingList;
  }

  Future<String> getNextOrderNumber({required String storeId}) async {
    final docPath = ApiPath.countersId(storeId);
    try {
      final counterDoc = await instance.getDocument<Map<String, dynamic>>(
        path: docPath,
        builder: (data, docId) => data,
      );

      int current = counterDoc['currentOrder'] ?? 0;
      int next = current + 1;

      await instance.setData(path: docPath, data: {'currentOrder': next});

      return next.toString().padLeft(5, '0');
    } catch (e) {
      await instance.setData(path: docPath, data: {'currentOrder': 1});
      return '00001';
    }
  }
}
