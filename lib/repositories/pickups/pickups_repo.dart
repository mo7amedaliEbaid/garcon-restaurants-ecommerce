import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_pickups_repo.dart';

class PickupsRepo extends BasePickupsRepo {
  @override
  Future<List<PickUp>> getPickupsByIdsAndCategory({
    required List<dynamic> pickupIds,
    required String category,
  }) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference pickupsCollection =
          FirebaseFirestore.instance.collection('pickups');

      // Query the pickups with the specified ids and category
      QuerySnapshot querySnapshot = await pickupsCollection
          .where('id', whereIn: pickupIds)
          .where('category', isEqualTo: category)
          .get();

      // Convert the QuerySnapshot into a list of PickUp objects
      List<PickUp> pickups = querySnapshot.docs
          .map((DocumentSnapshot document) => PickUp.fromSnapShot(document))
          .toList();

      return pickups;
    } catch (error) {
      // Handle any errors that occurred during the process
      log("Error fetching pickups: $error");
      return [];
    }
  }
}
