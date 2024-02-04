import 'package:flutter/material.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/presentation/widgets.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final TextEditingController _nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Text("Customer Name"),
        Space.yf(),
        customTextField(labelText: "Type here", controller: _nameController)
      ],
    );
  }
}
