import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import 'package:garcon/repositories/repositories.dart';

part 'get_reservations_state.dart';

class GetReservationsCubit extends Cubit<GetReservationsState> {
  final BaseReservationsRepository reservationsRepository;

  GetReservationsCubit({required this.reservationsRepository})
      : super(GetReservationsInitial());

  void getReservations(String userId) {
    emit(GetReservationLoading());
    reservationsRepository.getReservations(userId).listen(
      (reservations) {
        emit(GetReservationsLoaded(reservations: reservations));
      },
      onError: (error) {
        emit(GetReservationsError(errorMessage: error.toString()));
      },
    );
  }
}
