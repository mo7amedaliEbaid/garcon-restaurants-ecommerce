import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PickupsOrder extends Equatable {
  final String name;
  final String branch;

  final String date;
  final String time;

  final String itemsNumber;
  final String userId;
  final String restaurant;

   final String amount;

  const PickupsOrder({
    required this.time,
    required this.itemsNumber,
    required this.userId,
    required this.name,
    required this.branch,
    required this.date,
    required this.restaurant,
      required this.amount,
  });

  @override
  List<Object?> get props => [
        name,
        branch,
        date,
        time,
        itemsNumber,
        userId,
        restaurant,
        amount,
      ];

  factory PickupsOrder.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return PickupsOrder(
      name: data['name'],
      branch: data['branch'],
      date: data['date'],
      time: data['time'],
      amount: data['amount'],
      itemsNumber: data['itemsNumber'],
      userId: data['userId'],
      restaurant: data['restaurant'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'branch': branch,
      'date': date,
      'itemsNumber': itemsNumber,
      'time': time,
      'restaurant': restaurant,
      'amount': amount,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
  }
}
