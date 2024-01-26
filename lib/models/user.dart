import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flag/flag.dart';

class User extends Equatable {
  final String? id;
  final String email;
  final String countryCode;
  final String country;
  final String phoneNumber;

  const User({
    this.id,
    this.email = '',
    this.countryCode = '',
    this.country = '',
    this.phoneNumber = '',
  });

  User copyWith({
    String? id,
    String? email,
    String? countryCode,
    String? country,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      countryCode: countryCode ?? this.countryCode,
      country: country ?? this.country,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      email: snap['email'],
      countryCode: snap['countryCode'],
      country: snap['country'] ,
      phoneNumber: snap['phoneNumber'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'email': email,
      'countryCode': countryCode,
      'country': country,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  List<Object?> get props => [id, email, countryCode, country, phoneNumber];
}
