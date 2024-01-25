import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String email;

  final String countryCode;
  final String phoneNumber;

  User({
    this.id,
    this.email = '',
    this.countryCode = '',
    this.phoneNumber = '',
  });

  User copyWith({
    String? id,
    String? email,
    String? countryCode,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      email: snap['email'],
      countryCode: snap['countryCode'],
      phoneNumber: snap['phoneNumber'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'email': email,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  List<Object?> get props => [id, email, countryCode, phoneNumber];
}
