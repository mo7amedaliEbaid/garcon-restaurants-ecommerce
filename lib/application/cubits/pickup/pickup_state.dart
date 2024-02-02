part of 'pickup_cubit.dart';

abstract class PickupState extends Equatable {
  const PickupState();

  @override
  List<Object?> get props => [];
}

class PickupInitial extends PickupState {}

class PickupLoading extends PickupState {}

class PickupLoaded extends PickupState {
  final List<PickUp> pickups;

  const PickupLoaded({required this.pickups});

  @override
  List<Object?> get props => [pickups];
}

class PickupError extends PickupState {
  final String error;

  const PickupError({required this.error});

  @override
  List<Object?> get props => [error];
}
