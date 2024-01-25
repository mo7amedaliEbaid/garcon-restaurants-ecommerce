import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:garcon/application/application.dart';

import 'package:garcon/repositories/repositories.dart';
import 'package:garcon/models/models.dart';
import '../../../core/core.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription _authSubscription;
  StreamSubscription? _userSubscription;
  final AuthBloc authBloc;
  final BaseUserRepository userRepository;

  UserBloc({required this.authBloc, required this.userRepository})
      : super(UserState.initial()) {
    on<StartUserEvent>(_onStartUser);
    on<GetUserEvent>(_onGetUser);
    on<UserChangedEvent>(_oUserChanged);
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    _userSubscription?.cancel();
    _userSubscription = null;
    return super.close();
  }

  void _onStartUser(StartUserEvent event, Emitter<UserState> emit) {
    _authSubscription = authBloc.stream.listen((AuthState authState) {
      if (authState.status == AuthStatus.authenticated) {
        add(GetUserEvent(id: authState.user!.uid));
      }
    });
  }

  void _onGetUser(GetUserEvent event, Emitter<UserState> emit) {
    _userSubscription = userRepository.getUser(event.id).listen((User user) {
      log(user.email);
      add(UserChangedEvent(user: user));
    });
  }

  void _oUserChanged(UserChangedEvent event, Emitter<UserState> emit) {
    emit(state.copyWith(user: event.user));
  }
}
