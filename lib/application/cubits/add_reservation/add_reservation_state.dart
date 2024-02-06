part of 'add_reservation_cubit.dart';

abstract class AddReservationState extends Equatable {
  const AddReservationState();

  @override
  List<Object?> get props => [];
}

class AddReservationInitial extends AddReservationState {}

class ReservationAddedSuccessfully extends AddReservationState {}

class AddReservationLoading extends AddReservationState {}

class AddReservationError extends AddReservationState {
  final String errorMessage;

  const AddReservationError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
