import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcon/models/models.dart';

import 'dart:developer';

part 'base_cart_repo.dart';

class CartRepository implements BaseCartRepository {
  final FirebaseFirestore _firebaseFirestore;

  CartRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addToCart(String userId, PickUp pickUp) async {
    final userDocRef = _firebaseFirestore.collection('cart').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentCartItems = List.from(snapshot.get('pickups') ?? []);
        if (!currentCartItems.contains(pickUp.id)) {
          currentCartItems.add(pickUp.id);
        }

        transaction.update(userDocRef, {'pickups': currentCartItems});
      } else {
        transaction.set(userDocRef, {
          'pickups': [pickUp.id]
        });
      }
    });
  }

  @override
  Future<void> removeFromCart(String userId, String pickupId) async {
    final userDocRef = _firebaseFirestore.collection('cart').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentCartItems = List.from(snapshot.get('pickups') ?? []);
        currentCartItems.remove(pickupId);

        transaction.update(userDocRef, {'pickups': currentCartItems});
      }
    });
  }

  @override
  Stream<List<PickUp>> getCart(String userId) async* {
    final userDocRef = _firebaseFirestore.collection('cart').doc(userId);

    final StreamController<List<PickUp>> controller =
        StreamController<List<PickUp>>();

    userDocRef.snapshots().listen((snapshot) async {
      log('Snapshot data: ${snapshot.data()}');

      if (snapshot.exists) {
        final pickupIds = List<String>.from(snapshot.get('pickups') ?? []);
        log('Pickup IDs: $pickupIds');

        final List<PickUp> pickUps = [];

        for (final pickupId in pickupIds.map((id) => id.toString())) {
          final pickupDocSnapshot = await _firebaseFirestore
              .collection('pickups')
              .doc(pickupId) // Use doc instead of where clause
              .get();

          if (pickupDocSnapshot.exists) {
            final pickUp = PickUp.fromSnapShot(pickupDocSnapshot);
            log('Pickup Description for $pickupId: ${pickUp.description}');
            pickUps.add(pickUp);
          } else {
            log('Pickup document with ID $pickupId does not exist.');
          }
        }

        log('Cart Items: $pickUps');

        controller.add(pickUps);
      } else {
        log('User document does not exist.');
        controller.add([]);
      }
    });

    yield* controller.stream;
  }

  @override
  Future<bool> isInCart(String userId, String pickupId) async {
    final userDocRef = _firebaseFirestore.collection('cart').doc(userId);
    final snapshot = await userDocRef.get();

    if (snapshot.exists) {
      final pickupIds = List<String>.from(snapshot.get('pickups') ?? []);
      return pickupIds.contains(pickupId);
    } else {
      return false;
    }
  }

  @override
  Future<void> removeEntireCart(String userId) async {
    final userDocRef = _firebaseFirestore.collection('cart').doc(userId);

    try {
      await userDocRef.delete();
      log('Cart for user $userId successfully deleted.');
    } on FirebaseException catch (error) {
      log('Error deleting cart: ${error.code} - ${error.message}');
      // Handle error (e.g., throw an exception, return a specific error message)
    }
  }

}
