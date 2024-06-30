import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reservation extends Equatable {
  final String name;
  final String branch;
  final String date;
  final String time;
  final String personsNumber;
  final String userId;
  final String restaurant;
  final String amount;

  const Reservation({
    required this.time,
    required this.personsNumber,
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
        personsNumber,
        userId,
        restaurant,
        amount,
      ];

  factory Reservation.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Reservation(
      name: data['name'],
      branch: data['branch'],
      date: data['date'],
      time: data['time'],
      amount: data['amount'],
      personsNumber: data['personsNumber'],
      userId: data['userId'],
      restaurant: data['restaurant'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'branch': branch,
      'date': date,
      'personsNumber': personsNumber,
      'time': time,
      'restaurant': restaurant,
      'amount': amount,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
  }
}
