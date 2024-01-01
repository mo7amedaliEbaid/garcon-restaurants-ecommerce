part of 'filter_cubit.dart';

class FilterState extends Equatable {
  final List<Restaurant> filteredRestaurants;

  const FilterState({required this.filteredRestaurants});

  @override
  List<Object?> get props => [filteredRestaurants];
}

class FilterSuccessState extends FilterState {
  const FilterSuccessState({required List<Restaurant> filteredRestaurants})
      : super(filteredRestaurants: filteredRestaurants);
}

class FilterErrorState extends FilterState {
  final String errorMessage;

  FilterErrorState({required this.errorMessage})
      : super(filteredRestaurants: []);

  @override
  List<Object?> get props => [errorMessage];
}
