part of 'reservation_repo.dart';

abstract class BaseReservationsRepository {
  Future<void> addReservation(Reservation reservation);

  Stream<List<Reservation>> getReservations(String userId);
}