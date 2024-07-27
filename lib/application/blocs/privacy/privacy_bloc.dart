import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/repositories/privacy/base_privacy_repo.dart';

import '../../../models/info.dart';

part 'privacy_event.dart';

part 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  final BasePrivacyRepository _privacyRepository;

  PrivacyBloc(this._privacyRepository) : super(PrivacyInitial()) {
    on<GetPrivacyEvent>((event, emit) async {
      emit(PrivacyLoading());
      try {
        final privacy = await _privacyRepository.getPrivacy().first;
        emit(PrivacyLoaded(privacy));
      } catch (e) {
        emit(PrivacyError('Failed to fetch terms info: $e'));
      }
    });
  }
}
