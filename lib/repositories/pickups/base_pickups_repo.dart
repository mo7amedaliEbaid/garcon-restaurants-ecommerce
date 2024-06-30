part of 'pickups_repo.dart';

abstract class BasePickupsRepo {
  Future<List<PickUp>> getPickupsByIdsAndCategory(
      {required List<dynamic> pickupIds,
        required String category});
}