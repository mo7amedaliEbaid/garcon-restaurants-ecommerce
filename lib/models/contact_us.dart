import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUs {
  final String id;
  final String name;
  final String mobileNumber;
  final String email;
  final String message;
  final Timestamp timestamp;

  ContactUs({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.message,
    required this.timestamp,
  });

  factory ContactUs.fromDocument(DocumentSnapshot doc) {
    return ContactUs(
      id: doc['id'],
      name: doc['name'],
      mobileNumber: doc['mobileNumber'],
      email: doc['email'],
      message: doc['message'],
      timestamp: doc['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobileNumber': mobileNumber,
      'email': email,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
