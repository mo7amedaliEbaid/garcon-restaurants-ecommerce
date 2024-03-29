import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/repositories/repositories.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';

part 'about_us_event.dart';

part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  final BaseAboutRepository _aboutRepository;

  AboutUsBloc(this._aboutRepository) : super(AboutUsInitial()) {
    on<GetAboutUsEvent>((event, emit) async {
      emit(AboutUsLoading());
      try {
        final aboutUs = await _aboutRepository.getAboutUs().first;
        emit(AboutUsLoaded(aboutUs));
      } catch (e) {
        emit(AboutUsError('Failed to fetch about info: $e'));
      }
    });
  }
}
