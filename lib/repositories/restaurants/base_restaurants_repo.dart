part of 'restaurants_repo.dart';

abstract class BaseRestaurantsRepository {
  Stream<List<Restaurant>> getAllRestaurants();
}
