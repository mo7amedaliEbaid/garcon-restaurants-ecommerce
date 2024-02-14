part of 'orders_repo.dart';

abstract class BaseOrdersRepository {
  Future<void> placeOrder(PickupsOrder order);

  Stream<List<PickupsOrder>> getOrders(String userId);
}