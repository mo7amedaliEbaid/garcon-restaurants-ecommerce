/*
part of '../../cubits/pickup/pickup_cubit.dart';

abstract class PickupEvent extends Equatable {
  const PickupEvent();

  @override
  List<Object?> get props => [];
}

class FetchPickups extends PickupEvent {
  final List<String> pickupIds;
  final String category;

  const FetchPickups({required this.pickupIds, required this.category});

  @override
  List<Object?> get props => [pickupIds, category];
}
*/
