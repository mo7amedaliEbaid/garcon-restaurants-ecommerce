part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<Restaurant> searchedRestaurants;

  const SearchState({required this.searchedRestaurants});

  @override
  List<Object?> get props => [searchedRestaurants];
}

class SearchSuccessState extends SearchState {
  const SearchSuccessState({required List<Restaurant> searchedRestaurants})
      : super(searchedRestaurants: searchedRestaurants);
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState({required this.errorMessage})
      : super(searchedRestaurants: []);

  @override
  List<Object?> get props => [errorMessage];
}
