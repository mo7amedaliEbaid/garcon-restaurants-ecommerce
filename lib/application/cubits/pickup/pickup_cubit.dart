import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/repositories/repositories.dart';

import '../../../models/models.dart';

part 'pickup_state.dart';

class PickupCubit extends Cubit<PickupState> {
  final BasePickupsRepo pickupRepo;

  PickupCubit({required this.pickupRepo}) : super(PickupInitial());

  void fetchPickups(List<dynamic> pickupIds, String category) async {
    emit(PickupLoading());

    try {
      List<PickUp> pickups = await pickupRepo.getPickupsByIdsAndCategory(
        pickupIds: pickupIds,
        category: category,
      );
      emit(PickupLoaded(pickups: pickups));
    } catch (error) {
      emit(PickupError(error: "Failed to fetch pickups: $error"));
    }
  }
}
