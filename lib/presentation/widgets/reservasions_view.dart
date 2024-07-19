import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/presentation/widgets.dart';

import 'package:garcon/core/core.dart';

class ReservationsView extends StatelessWidget {
  const ReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReservationsCubit, GetReservationsState>(
      builder: (context, state) {
        if (state is GetReservationsLoaded && state.reservations.isNotEmpty) {
          return ListView.separated(
            itemCount: state.reservations.length,
            padding: Space.all(1.5, 1),
            itemBuilder: (context, index) {
              return reservationItem(
                reservation: state.reservations[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Space.yf();
            },
          );
        } else if (state is GetReservationsLoaded &&
            state.reservations.isEmpty) {
          return emptyScreen(
            text: "You Don’t have any\nBookings",
            svg: AppAssets.emptyBooking,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
