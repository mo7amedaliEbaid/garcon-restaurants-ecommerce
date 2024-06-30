import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final BaseRestaurantsRepository _repository;

  FilterCubit({required BaseRestaurantsRepository repository})
      : _repository = repository,
        super(const FilterState(filteredRestaurants: []));

  void filterByTag(List<Restaurant> restaurants, String tag) {
    try {
      List<Restaurant> filteredList =
          _repository.filterRestaurantsByTag(restaurants, tag);
      emit(FilterSuccessState(filteredRestaurants: filteredList));
    } catch (e) {
      emit(FilterErrorState(errorMessage: "Error filtering restaurants."));
    }
  }
}
/*class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState(filteredRestaurants: []));

  void filterByTag(List<Restaurant> restaurants, String tag) {
    try {
      List<Restaurant> filteredList = restaurants
          .where((restaurant) => restaurant.tags.contains(tag))
          .toList();

      emit(FilterSuccessState(filteredRestaurants: filteredList));
    } catch (e) {
      emit(FilterErrorState(errorMessage: "Error filtering restaurants."));
    }
  }
}*/
