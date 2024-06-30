import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/repositories/repositories.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final BaseCartRepository _repository;
  StreamSubscription? _streamSubscription;

  CartCubit(this._repository) : super(CartInitial());

  Future<void> loadCart(String userId) async {
    try {
      _streamSubscription?.cancel();
      _streamSubscription = _repository.getCart(userId).listen(
        (pickUps) {
          emit(
            CartLoaded(pickUps),
          );
        },
      );
    } catch (e) {
      emit(CartError('Error loading cart items: $e'));
    }
  }

  void toggleCartItem(String userId, PickUp pickup) async {
    final isInCart = await _repository.isInCart(userId, pickup.id);

    if (isInCart) {
      await _repository.removeFromCart(userId, pickup.id);
    } else {
      await _repository.addToCart(userId, pickup);
    }

    loadCart(userId);
  }
}
