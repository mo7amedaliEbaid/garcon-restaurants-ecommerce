import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/repositories/terms/base_terms_repo.dart';
import 'package:meta/meta.dart';

part 'terms_event.dart';

part 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  final BaseTermsRepository _termsRepository;

  TermsBloc(this._termsRepository) : super(TermsInitial()) {
    on<GetTermsEvent>((event, emit) async {
      emit(TermsLoading());
      try {
        final terms = await _termsRepository.getTerms().first;
        emit(TermsLoaded(terms));
      } catch (e) {
        emit(TermsError('Failed to fetch terms info: $e'));
      }
    });
  }
}
