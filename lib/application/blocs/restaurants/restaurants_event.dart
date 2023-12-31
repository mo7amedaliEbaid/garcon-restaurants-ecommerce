part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsEvent extends Equatable {
  const RestaurantsEvent();

  @override
  List<Object> get props => [];
}

class LoadRestaurants extends RestaurantsEvent {}

class UpdateRestaurants extends RestaurantsEvent {
  final List<Restaurant> restaurants;

  const UpdateRestaurants(this.restaurants);

  @override
  List<Object> get props => [restaurants];
}
