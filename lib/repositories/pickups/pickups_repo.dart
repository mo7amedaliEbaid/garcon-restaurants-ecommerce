import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_pickups_repo.dart';

class PickupsRepo extends BasePickupsRepo {
  @override
  Future<List<PickUp>> getPickupsByIdsAndCategory(
      {required List<String> pickupIds, required String category}) {
    // TODO: implement getPickupsByIdsAndCategory
    throw UnimplementedError();
  }
}
