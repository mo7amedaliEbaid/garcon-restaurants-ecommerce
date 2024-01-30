import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/models.dart';

part 'base_user_repo.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
    FirebaseAuth? firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<CurrentUser> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => CurrentUser.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(
      {required CurrentUser updatedUser,
      // required User currentUser,
      required String userId}) async {
    try {
      await _firebaseFirestore.collection('users').doc(userId).update({
        'countryCode': updatedUser.countryCode,
        'phoneNumber': updatedUser.phoneNumber,
        // 'email': updatedUser.email,
        'userName': updatedUser.userName,
        'country': updatedUser.country,
      });
    } catch (e) {
      log('Error updating user: $e');
      // Handle any errors that may occur during the update
      rethrow; // Rethrow the exception to allow for further handling
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        // Authenticate with current password before updating
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );
        await user.reauthenticateWithCredential(credential);

        // Update password in Firebase Authentication
        await user.updatePassword(newPassword);
      } else {
        throw Exception('User is not signed in');
      }
    } catch (e) {
      log('Error changing password: $e');
      // Handle specific errors like invalid password or network issues
      rethrow; // Rethrow the exception to allow for further handling
    }
  }
}
