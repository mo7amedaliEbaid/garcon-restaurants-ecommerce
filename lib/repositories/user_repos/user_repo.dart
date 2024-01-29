import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_user_repo.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(
      {required User updatedUser,
      required User currentUser,
      required String userId}) async {
    try {
      await _firebaseFirestore.collection('users').doc(userId).update({
        'countryCode': updatedUser.countryCode,
        'phoneNumber': updatedUser.phoneNumber,
        'email': updatedUser.email,
        'userName': updatedUser.userName,
        'country': updatedUser.country,
      });
    } catch (e) {
      log('Error updating user: $e');
      // Handle any errors that may occur during the update
      rethrow; // Rethrow the exception to allow for further handling
    }
  }
}
