import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_reservation_repo.dart';

class ReservationRepository extends BaseReservationsRepository {
  final CollectionReference reservationCollection =
      FirebaseFirestore.instance.collection('reservations');

  @override
  Future<void> addReservation(Reservation reservation) async {
    await reservationCollection.doc().set(reservation.toDocument());
  }

  @override
  Stream<List<Reservation>> getReservations(String userId) {
    return reservationCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Reservation.fromSnapshot(doc)).toList();
    });
  }
}
