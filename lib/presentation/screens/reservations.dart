import 'package:flutter/material.dart';
import 'package:garcon/presentation/widgets.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "My Reservation",isWithArrow: false),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
