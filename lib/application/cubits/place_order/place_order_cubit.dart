import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/models/models.dart';

import 'package:garcon/repositories/repositories.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  final BaseOrdersRepository ordersRepository;

  PlaceOrderCubit({required this.ordersRepository})
      : super(PlaceOrderInitial());

  Future<void> placeOrder(PickupsOrder order) async {
    emit(PlaceOrderLoading());
    try {
      await ordersRepository.placeOrder(order);
      emit(OrderPlacedSuccessfully());
    } catch (e) {
      emit(const PlaceOrderError(errorMessage: 'Failed to place order'));
    }
  }
}
