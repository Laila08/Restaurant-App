import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/data/models/booking_model.dart';
import 'package:food_delivery/utils/api_path.dart';

import 'firestore_services.dart';

abstract class BookingServices {
}

class BookingServicesImp implements BookingServices {
  final instance = FirestoreServices.instance;
  Future<void> createBooking(BookingModel bookingModel)async{
    await instance.setData(path: ApiPath.bookingDoc(bookingModel.id!), data: bookingModel.toMap());
  }

  Future<BookingModel> fetchPendingOrders(String id)async{
    final bookingList = await instance.getDocument(path: ApiPath.bookingDoc(id), builder: (data, documentID) => BookingModel.fromMap(data,documentID),);
    return bookingList;
  }
  /// دالة للحصول على الرقم التالي للطلب باستخدام getDocument
  Future<String> getNextOrderNumber({required String storeId}) async {
    final docPath = 'counters/$storeId';

    try {
      final counterDoc = await instance.getDocument<Map<String, dynamic>>(
        path: docPath,
        builder: (data, docId) => data,
      );

      int current = counterDoc['currentOrder'] ?? 0;
      int next = current + 1;

      // تحديث الرقم في الداتابيز
      await instance.setData(path: docPath, data: {'currentOrder': next});

      return next.toString().padLeft(5, '0'); // مثال: "00013"
    } catch (e) {
      // إذا لم يكن موجوداً، نبدأ من 1
      await instance.setData(path: docPath, data: {'currentOrder': 1});
      return '00001';
    }
  }
}
