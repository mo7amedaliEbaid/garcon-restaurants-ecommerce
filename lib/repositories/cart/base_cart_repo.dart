part of 'cart_repo.dart';

abstract class BaseCartRepository {
  Future<void> addToCart(String userId, PickUp pickUp);

  Future<void> removeFromCart(String userId, String pickupId);

  Stream<List<PickUp>> getCart(String userId);

  Future<bool> isInCart(String userId, String pickupId);

  Future<void> removeEntireCart(String userId);
}
