import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/models/models.dart';

import '../../../repositories/restaurants/restaurants_repo.dart';

part 'tags_event.dart';

part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  final BaseRestaurantsRepository _restaurantsRepository;
  StreamSubscription? _streamSubscription;

  TagsBloc({required BaseRestaurantsRepository restaurantsRepository})
      : _restaurantsRepository = restaurantsRepository,
        super(const TagsLoaded()) {
    on<LoadTags>(_mapLoadTagsToState);
    on<UpdateTags>(_mapUpdateTagsToState);
  }

  FutureOr<void> _mapUpdateTagsToState(
      UpdateTags event, Emitter<TagsState> emit) async {
    emit(TagsLoaded(tags: event.tags));
  }

  FutureOr<void> _mapLoadTagsToState(
      LoadTags event, Emitter<TagsState> emit) async {
    _streamSubscription?.cancel();
    _streamSubscription = _restaurantsRepository.getAllTags().listen(
      (tags) {
        add(
          UpdateTags(tags),
        );
      },
    );
  }
}
