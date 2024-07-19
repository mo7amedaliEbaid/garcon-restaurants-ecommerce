import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/presentation/widgets/reservation_item.dart';

import '../../configs/space.dart';

class PreOrdersView extends StatelessWidget {
  const PreOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersLoaded && state.orders.isNotEmpty) {
          return Expanded(
            //height: AppDimensions.normalize(200),
            child: ListView.separated(
              itemCount: state.orders.length,
              padding: Space.all(1.5, 1),
              itemBuilder: (context, index) {
                return const SizedBox.shrink();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Space.yf();
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
