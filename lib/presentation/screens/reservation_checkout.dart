import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/presentation/widgets.dart';
import '../../application/application.dart';

class ReservationCheckoutScreen extends StatelessWidget {
  const ReservationCheckoutScreen({
    super.key,
    required this.reservation,
  });

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    pay() {
      context.read<AddReservationCubit>().addReservation(reservation).then(
            (value) =>
                Navigator.of(context).pushNamed(AppRouter.successfulBooking),
          );
    }

    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          pay();
        }
      },
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: "Checkout",
          isWithArrow: true,
        ),
        body: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: Space.all(1.3, 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation.restaurant.capitalize(),
                      style: AppText.h2b,
                    ),
                    Space.yf(.2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: AppDimensions.normalize(8),
                        ),
                        Space.xf(.2),
                        Text(
                          reservation.branch.capitalize(),
                          style: AppText.h3,
                        )
                      ],
                    ),
                    Space.yf(1.5),
                    Text(
                      "Customer Name:",
                      style: AppText.h3,
                    ),
                    Space.yf(.2),
                    Text(
                      reservation.name.capitalize(),
                      style: AppText.h3b,
                    ),
                    Space.yf(1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Booking Date:",
                              style: AppText.h3,
                            ),
                            Space.yf(.2),
                            Text(
                              reservation.date,
                              style: AppText.h3b,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Booking Time:",
                              style: AppText.h3,
                            ),
                            Space.yf(.2),
                            Text(
                              reservation.time,
                              style: AppText.h3b,
                            )
                          ],
                        )
                      ],
                    ),
                    Space.yf(1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "No. of Persons:",
                              style: AppText.h3,
                            ),
                            Space.yf(.2),
                            Text(
                              reservation.personsNumber,
                              style: AppText.h3b,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Tawla Location:",
                              style: AppText.h3,
                            ),
                            Space.yf(.2),
                            Text(
                              "Any",
                              style: AppText.h3b,
                            )
                          ],
                        )
                      ],
                    ),
                    Space.yf(1.5),
                    Text(
                      "Occasion:",
                      style: AppText.h3,
                    ),
                    Space.yf(.2),
                    Text(
                      "No Occasion",
                      style: AppText.h3b,
                    ),
                    Space.yf(1.5),
                    Text(
                      "Special Request:",
                      style: AppText.h3,
                    ),
                    Space.yf(.2),
                    Text(
                      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown.",
                      style: AppText.b1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              reservationAmountColumn("25"),
            //  Space.y!,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customElevatedButton(
                      width: AppDimensions.normalize(65),
                      height: AppDimensions.normalize(20),
                      color: AppColors.deepRed,
                      borderRadius: AppDimensions.normalize(7),
                      text: "Pay 25 USD",
                      textStyle: AppText.b1b!.copyWith(color: Colors.white),
                      onPressed: () {
                        //    Navigator.of(context).pushNamed(AppRouter.payment);
                        context.read<PaymentCubit>().createPaymentIntent(
                              amount: '25',
                            );
                      }),
                  customOutlinedButton(
                      width: AppDimensions.normalize(65),
                      height: AppDimensions.normalize(20),
                      borderColor: AppColors.darkRed,
                      borderRadius: AppDimensions.normalize(7),
                      text: "Pay On Arrival",
                      textStyle: AppText.b1b!.copyWith(color: AppColors.darkRed),
                      onPressed: () {
                        pay();
                        // context.read<SelectedTapCubit>().updateIndex(1);
                      })
                ],
              ),
              Space.yf(),
              /*customElevatedButton(
                width: double.infinity,
                height: AppDimensions.normalize(22),
                color: AppColors.deepRed,
                borderRadius: 0,
                text: "Proceed",
                textStyle: AppText.h3b!.copyWith(color: Colors.white),
                onPressed: () async {
                  await context
                      .read<AddReservationCubit>()
                      .addReservation(reservation);
                  Navigator.of(context).pushNamed(AppRouter.successfulBooking);
                })*/
            ],
          ),
        ),
      ),
    );
  }
}
