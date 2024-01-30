part of 'pickups_repo.dart';

abstract class BasePickupsRepo {
  Future<List<PickUp>> getPickupsByIdsAndCategory(
      {required List<String> pickupIds,
        required String category});
}