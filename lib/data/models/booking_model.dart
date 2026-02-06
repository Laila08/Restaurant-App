import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String? id;
  final String phone;
  final String orderNumber;
  final int totalPrice;
  final int pickupAfterMinutes;
  final String status; // pending / accepted / done / cancelled
  final Timestamp? createdAt;

  BookingModel({
    this.id,
    required this.phone,
    required this.totalPrice,
    required this.pickupAfterMinutes,
    this.status = "pending",
    this.createdAt,
    required this.orderNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "phone": phone,
      "totalPrice": totalPrice,
      "pickupAfterMinutes": pickupAfterMinutes,
      "status": status,
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
      "orderNumber":orderNumber
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map, String docId) {
    return BookingModel(
      id: docId,
      phone: map["phone"] ?? "",
      totalPrice: (map["totalPrice"] ?? 0).toInt(),
      pickupAfterMinutes: (map["pickupAfterMinutes"] ?? 30).toInt(),
      status: map["status"] ?? "pending",
      createdAt: map["createdAt"], orderNumber: '',
    );
  }
}
