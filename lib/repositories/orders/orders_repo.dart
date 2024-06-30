import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcon/models/models.dart';

part 'base_orders_repo.dart';

class OrdersRepository extends BaseOrdersRepository {
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

  @override
  Future<void> placeOrder(PickupsOrder order) async {
    await ordersCollection.doc().set(order.toDocument());
  }

  @override
  Stream<List<PickupsOrder>> getOrders(String userId) {
    return ordersCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => PickupsOrder.fromSnapshot(doc))
          .toList();
    });
  }
}
