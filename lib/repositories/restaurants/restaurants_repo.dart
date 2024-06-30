import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_restaurants_repo.dart';

class RestaurantsRepo extends BaseRestaurantsRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantsRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Restaurant>> getAllRestaurants() {
    return _firebaseFirestore
        .collection('restaurants')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Restaurant.fromSnapShot(doc);
      }).toList();
    });
  }

  //Instead Of filtering restaurants from firestore directly i decided to
  // filter the list that already retrieved.
  @override
  List<Restaurant> filterRestaurantsByTag(
      List<Restaurant> restaurants, String tag) {
    return restaurants
        .where((restaurant) => restaurant.tags.contains(tag))
        .toList();
  }

// If you want to filter restaurants from firestore directly.

/*  @override
  Stream<List<Restaurant>> filterRestaurantsByTag(String tag) {
    return _firebaseFirestore
        .collection('restaurants')
        .where('tags', arrayContains: tag)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Restaurant.fromSnapShot(doc);
      }).toList();
    });
  }*/
  @override
  List<Restaurant> searchRestaurantsByName(
      List<Restaurant> restaurants, String name) {
    return restaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  @override
  Stream<List<Tag>> getAllTags() {
    return _firebaseFirestore.collection('tags').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Tag.fromSnapShot(doc);
      }).toList();
    });
  }
}
