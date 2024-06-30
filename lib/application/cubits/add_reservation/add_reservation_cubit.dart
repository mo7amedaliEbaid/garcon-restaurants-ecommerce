import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import 'package:garcon/repositories/repositories.dart';

part 'add_reservation_state.dart';

class AddReservationCubit extends Cubit<AddReservationState> {
  final BaseReservationsRepository reservationsRepository;

  AddReservationCubit({required this.reservationsRepository})
      : super(AddReservationInitial());

  Future<void> addReservation(Reservation reservation) async {
    emit(AddReservationLoading());
    try {
      await reservationsRepository.addReservation(reservation);
      emit(ReservationAddedSuccessfully());
    } catch (e) {
      emit(
          const AddReservationError(errorMessage: 'Failed to add reservation'));
    }
  }
}
