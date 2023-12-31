import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/core.dart';
import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final BaseAuthRepository authRepository;
  SignUpBloc({required this.authRepository}) : super(SignUpState.initial()) {
    on<SignUpWithCredential>(_mapSignInWithCredentialToState);
  }

  FutureOr<void> _mapSignInWithCredentialToState(
      SignUpWithCredential event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.submitting));

    try {
      await authRepository.signUp(user: event.user, password: event.password);

      emit(state.copyWith(status: SignUpStatus.success));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: SignUpStatus.error,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}