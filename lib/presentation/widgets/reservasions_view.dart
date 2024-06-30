import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/app_dimensions.dart';
import 'package:garcon/configs/space.dart';
import 'package:garcon/presentation/widgets.dart';

class ReservationsView extends StatelessWidget {
  const ReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReservationsCubit, GetReservationsState>(
      builder: (context, state) {
        if (state is GetReservationsLoaded && state.reservations.isNotEmpty) {
          return SizedBox(
            height: AppDimensions.normalize(200),
            child: ListView.separated(
              itemCount: state.reservations.length,
              padding: Space.hf(1.5),
              itemBuilder: (context, index) {
                return reservationItem(
                  reservation: state.reservations[index],
                );
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
