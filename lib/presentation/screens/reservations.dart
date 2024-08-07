import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/presentation/widgets.dart';
import '../../configs/configs.dart';
import '../../core/core.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({
    super.key,
    // this.selectedIndex,
  });

  //  final int? selectedIndex;

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    context.read<GetReservationsCubit>().getReservations(
          FirebaseAuth.instance.currentUser!.uid,
        );
    context.read<GetOrdersCubit>().getOrders(
          FirebaseAuth.instance.currentUser!.uid,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      const ReservationsView(),
      const PreOrdersView(),
    ];

    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "My Reservation",
        isWithArrow: false,
      ),
      body: BlocProvider(
        create: (context) => SelectedTapCubit(),
        child: Column(
          children: [
            Space.yf(1.2),
            BlocBuilder<SelectedTapCubit, int>(
              builder: (context, selectedTapIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0; i < 2; i++)
                      GestureDetector(
                        onTap: () =>
                            context.read<SelectedTapCubit>().updateIndex(i),
                        child: AnimatedContainer(
                          height: AppDimensions.normalize(18),
                          width: AppDimensions.normalize(55),
                          margin: EdgeInsets.only(
                            top: AppDimensions.normalize(4),
                          ),
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: selectedTapIndex == i
                                ? AppColors.deepRed
                                : Colors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.normalize(4),
                            ),
                            border: Border.all(
                              color: AppColors.deepRed,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.reservationTaps[i],
                              style: AppText.h3?.copyWith(
                                color: selectedTapIndex == i
                                    ? Colors.white
                                    : AppColors.deepRed,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            Space.yf(1.5),
            Expanded(
              child: BlocBuilder<SelectedTapCubit, int>(
                builder: (context, selectedTapIndex) {
                  return views[selectedTapIndex];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
