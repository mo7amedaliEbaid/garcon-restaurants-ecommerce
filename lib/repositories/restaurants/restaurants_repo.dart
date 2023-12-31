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
}
