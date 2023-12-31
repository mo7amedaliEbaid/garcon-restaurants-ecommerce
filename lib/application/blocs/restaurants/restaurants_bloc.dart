import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/models/models.dart';

import 'package:flutter/material.dart';

import '../../../repositories/restaurants/restaurants_repo.dart';

part 'restaurants_event.dart';

part 'restaurants_state.dart';


class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final BaseRestaurantsRepository _restaurantsRepository;
  StreamSubscription? _streamSubscription;

  RestaurantsBloc({required BaseRestaurantsRepository restaurantsRepository})
      : _restaurantsRepository = restaurantsRepository,
        super(const RestaurantsLoaded()) {
    on<LoadRestaurants>(_mapLoadRestaurantsToState);
    on<UpdateRestaurants>(_mapUpdateRestaurantsToState);
  }

  FutureOr<void> _mapUpdateRestaurantsToState(
      UpdateRestaurants event, Emitter<RestaurantsState> emit) async {
    emit(RestaurantsLoaded(restaurants: event.restaurants));
  }

  FutureOr<void> _mapLoadRestaurantsToState(
      LoadRestaurants event, Emitter<RestaurantsState> emit) async {
    _streamSubscription?.cancel();
    _streamSubscription = _restaurantsRepository.getAllRestaurants().listen(
      (restaurants) {
        add(
          UpdateRestaurants(restaurants),
        );
      },
    );
  }
}
