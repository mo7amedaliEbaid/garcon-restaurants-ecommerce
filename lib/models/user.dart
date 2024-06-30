import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flag/flag.dart';

class CurrentUser extends Equatable {
  final String? id;
  final String email;
  final String userName;
  final String countryCode;
  final String country;
  final String phoneNumber;

  const CurrentUser({
    this.id,
    this.email = '',
    this.userName = '',
    this.countryCode = '',
    this.country = '',
    this.phoneNumber = '',
  });

  CurrentUser copyWith({
    String? id,
    String? email,
    String? userName,
    String? countryCode,
    String? country,
    String? phoneNumber,
  }) {
    return CurrentUser(
      id: id ?? this.id,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      countryCode: countryCode ?? this.countryCode,
      country: country ?? this.country,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory CurrentUser.fromSnapshot(DocumentSnapshot snap) {
    return CurrentUser(
      id: snap.id,
      email: snap['email'],
      userName: snap['userName'],
      countryCode: snap['countryCode'],
      country: snap['country'],
      phoneNumber: snap['phoneNumber'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'email': email,
      'userName': userName,
      'countryCode': countryCode,
      'country': country,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  List<Object?> get props =>
      [id, email, userName, countryCode, country, phoneNumber];
}
