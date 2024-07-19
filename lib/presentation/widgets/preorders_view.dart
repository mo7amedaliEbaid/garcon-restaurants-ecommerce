import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/presentation/widgets.dart';
import 'package:garcon/core/core.dart';
import '../../configs/configs.dart';

class PreOrdersView extends StatelessWidget {
  const PreOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersLoaded && state.orders.isNotEmpty) {
          return ListView.separated(
            itemCount: state.orders.length,
            padding: Space.all(1.5, 1),
            itemBuilder: (context, index) {
              return preOrderItem(
                pickupsOrder: state.orders[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Space.yf();
            },
          );
        } else if (state is GetOrdersLoaded && state.orders.isEmpty) {
          return emptyScreen(
            text: "You Don’t have any \n Pre-Order",
            svg: AppAssets.emptyCart,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
