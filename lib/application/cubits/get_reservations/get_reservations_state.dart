part of 'get_reservation_cubit.dart';

abstract class GetReservationsState extends Equatable {
  const GetReservationsState();

  @override
  List<Object?> get props => [];
}

class GetReservationsInitial extends GetReservationsState {}

class GetReservationLoading extends GetReservationsState {}

class GetReservationsLoaded extends GetReservationsState {
  final List<Reservation> reservations;

  const GetReservationsLoaded({required this.reservations});

  @override
  List<Object?> get props => [reservations];
}

class GetReservationsError extends GetReservationsState {
  final String errorMessage;

  const GetReservationsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
