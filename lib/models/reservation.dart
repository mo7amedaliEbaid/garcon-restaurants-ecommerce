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

  const Reservation({
    required this.time,
    required this.personsNumber,
    required this.userId,
    required this.name,
    required this.branch,
    required this.date,
  });

  @override
  List<Object?> get props => [
        name,
        branch,
        date,
        time,
        personsNumber,
        userId,
      ];

  factory Reservation.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Reservation(
      name: data['name'],
      branch: data['branch'],
      date: data['date'],
      time: data['time'],
      personsNumber: data['personsNumber'],
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'branch': branch,
      'date': date,
      'personsNumber': personsNumber,
      'time': time,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
  }
}
