import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

part 'contact_us_event.dart';

part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final BaseContactUsRepository _contactUsRepository;

  ContactUsBloc(this._contactUsRepository)
      : super(
          ContactUsInitial(),
        ) {
    on<AddContactUs>((event, emit) async {
      emit(
        ContactUsLoading(),
      );
      try {
        await _contactUsRepository.addContactUs(event.contactUs);
        emit(
          ContactUsSuccess(),
        );
      } catch (e) {
        emit(
          ContactUsFailure("error sending message $e"),
        );
      }
    });
  }
}
