part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsState extends Equatable {
  const RestaurantsState();

  @override
  List<Object> get props => [];
}

class RestaurantsLoading extends RestaurantsState {}

class RestaurantsLoaded extends RestaurantsState {
  final List<Restaurant> restaurants;

  const RestaurantsLoaded({this.restaurants = const <Restaurant>[]});

  @override
  List<Object> get props => [restaurants];
}
