import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/presentation/widgets.dart';

class PickupsCheckout extends StatefulWidget {
  const PickupsCheckout({
    super.key,
    required this.restaurant,
    required this.amount,
    required this.itemsNumber,
  });

  final Restaurant restaurant;
  final String amount;
  final String itemsNumber;

  @override
  State<PickupsCheckout> createState() => _PickupsCheckoutState();
}

class _PickupsCheckoutState extends State<PickupsCheckout> {
  final TextEditingController _nameController = TextEditingController();
  List<String> dropDownItems = [];
  String dropDownValue = "Select Branch";
  TimeOfDay selectedTime = TimeOfDay.now();
  Validators validators = Validators();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  void initState() {
    dropDownItems = ["Select Branch", ...widget.restaurant.branches];
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pay() {
      context
          .read<PlaceOrderCubit>()
          .placeOrder(
            PickupsOrder(
              time: selectedTime.format(context).toString(),
              userId: FirebaseAuth.instance.currentUser?.uid ?? "",
              name: _nameController.text.trim().toString(),
              branch: dropDownValue,
              restaurant: widget.restaurant.name,
              date: DateTime.now().toString().substring(0, 10),
              itemsNumber: widget.itemsNumber,
              amount: widget.amount,
            ),
          )
          .then((value) => context
              .read<CartCubit>()
              .removeCart(FirebaseAuth.instance.currentUser?.uid ?? ""))
          .then(
        (value) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.root,
            arguments: "pickups",
            (route) => false,
          );
        },
      );
    }

    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          pay();
         // context.read<SelectedTapCubit>().updateIndex(1);
        }
      },
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: "Checkout",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: Space.hf(1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space.yf(1.5),
                    Text(
                      widget.restaurant.name.capitalize(),
                      style: AppText.h2b,
                    ),
                    Space.yf(.1),
                    Text(
                      "(Order will be ready for pick-up in 45 minutes)",
                      style: AppText.b2?.copyWith(color: AppColors.greyColor),
                    ),
                    Space.yf(1.5),
                    Text(
                      "Customer Name",
                      style: AppText.b1b,
                    ),
                    Space.yf(.5),
                    customTextField(
                      labelText: "Type here",
                      controller: _nameController,
                      validator: validators.validateCustomerName,
                    ),
                    Space.yf(1.5),
                    Text(
                      "Restaurant Branch",
                      style: AppText.b1b,
                    ),
                    Space.yf(.5),
                    Container(
                      padding: Space.h1!,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.normalize(4),
                        ),
                      ),
                      child: DropdownButton(
                          isExpanded: true,
                          underline: const SizedBox.shrink(),
                          value: dropDownValue,
                          items: dropDownItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value!;
                            });
                          }),
                    ),
                    Space.yf(1.5),
                    Text(
                      "Pickup Time",
                      style: AppText.b1b,
                    ),
                    Space.yf(.5),
                    Container(
                      padding: Space.all(1.1, .7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.normalize(4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(selectedTime.format(context)),
                          GestureDetector(
                            onTap: () {
                              _selectTime(context);
                            },
                            child: const Icon(
                              Icons.timelapse,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Space.yf(.4),
                    Text(
                      "For Today (${DateTime.now().toString().substring(0, 10)})",
                      style: AppText.b2?.copyWith(color: AppColors.greyColor),
                    ),
                    Space.yf(2.5),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Total Amount",
                            style: AppText.h3b,
                          ),
                          Space.yf(.2),
                          Text(
                            "${widget.amount} KWD",
                            style:
                                AppText.h1b?.copyWith(color: AppColors.deepRed),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Space.yf(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customElevatedButton(
                      width: AppDimensions.normalize(65),
                      height: AppDimensions.normalize(20),
                      color: AppColors.deepRed,
                      borderRadius: AppDimensions.normalize(7),
                      text:
                          "Pay ${convertKwdToUsd(double.parse(widget.amount))} USD",
                      textStyle: AppText.b1b!.copyWith(color: Colors.white),
                      onPressed: () {
                        //    Navigator.of(context).pushNamed(AppRouter.payment);
                        context.read<PaymentCubit>().createPaymentIntent(
                              amount:
                                  '${convertKwdToUsd(double.parse(widget.amount))}',
                            );
                      }),
                  customOutlinedButton(
                      width: AppDimensions.normalize(65),
                      height: AppDimensions.normalize(20),
                      borderColor: AppColors.darkRed,
                      borderRadius: AppDimensions.normalize(7),
                      text: "Pay On Pickup",
                      textStyle:
                          AppText.b1b!.copyWith(color: AppColors.darkRed),
                      onPressed: () {
                        pay();
                       // context.read<SelectedTapCubit>().updateIndex(1);
                      })
                ],
              ),
              Space.yf()
            ],
          ),
        ),
      ),
    );
  }
}
