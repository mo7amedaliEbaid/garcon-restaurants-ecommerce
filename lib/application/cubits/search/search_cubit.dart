import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BaseRestaurantsRepository _repository;

  SearchCubit({required BaseRestaurantsRepository repository})
      : _repository = repository,
        super(const SearchState(searchedRestaurants: []));

  void searchByName(List<Restaurant> restaurants, String name) {
    try {
      List<Restaurant> searchedList =
          _repository.searchRestaurantsByName(restaurants, name);
      emit(SearchSuccessState(searchedRestaurants: searchedList));
    } catch (e) {
      emit(SearchErrorState(errorMessage: "Error filtering restaurants."));
    }
  }
}
