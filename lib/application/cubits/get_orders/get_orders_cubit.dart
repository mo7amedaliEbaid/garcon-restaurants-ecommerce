import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import 'package:garcon/repositories/repositories.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final BaseOrdersRepository ordersRepository;

  GetOrdersCubit({required this.ordersRepository}) : super(GetOrdersInitial());

  void getOrders(String userId) {
    emit(GetOrdersLoading());
    ordersRepository.getOrders(userId).listen(
      (orders) {
        emit(GetOrdersLoaded(orders: orders));
      },
      onError: (error) {
        emit(GetOrdersError(errorMessage: error.toString()));
      },
    );
  }
}
