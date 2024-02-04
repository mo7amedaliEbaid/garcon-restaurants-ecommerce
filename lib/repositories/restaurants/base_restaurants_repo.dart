part of 'restaurants_repo.dart';

abstract class BaseRestaurantsRepository {
  Stream<List<Restaurant>> getAllRestaurants();

  List<Restaurant> filterRestaurantsByTag(
      List<Restaurant> restaurants, String tag);

// Stream<List<Restaurant>> filterRestaurantsByTag(String tag);
  List<Restaurant> searchRestaurantsByName(
      List<Restaurant> restaurants, String name);

  Stream<List<Tag>> getAllTags();
}
