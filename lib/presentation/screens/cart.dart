import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/app_dimensions.dart';
import 'package:garcon/configs/app_typography.dart';
import 'package:garcon/configs/space.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().loadCart(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Cart",
      ),
      body: Column(
        children: [
          Space.yf(2.5),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoaded && state.pickUps.isNotEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: AppDimensions.normalize(180),
                      child: ListView.separated(
                        itemCount: state.pickUps.length,
                        itemBuilder: (context, index) {
                          return pickupItem(
                            context: context,
                            pickUp: state.pickUps[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Space.yf();
                        },
                      ),
                    ),
                    Space.yf(.5),
                    Container(
                      width: double.infinity,
                      height: AppDimensions.normalize(16),
                      margin: Space.hf(2),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.deepRed),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.normalize(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.deepRed,
                          ),
                          Space.yf(.3),
                          Text(
                            "Add More Meals",
                            style:
                                AppText.h3?.copyWith(color: AppColors.deepRed),
                          )
                        ],
                      ),
                    ),

                  ],
                );
              } else if (state is CartLoaded && state.pickUps.isEmpty) {
                return Text("empty");
              } else {
                return Text("error");
              }
            },
          ),
          Space.ym!,
          customElevatedButton(
              withArrow: true,
              width: double.infinity,
              height: AppDimensions.normalize(20),
              color: AppColors.deepRed,
              borderRadius: 0,
              text: "Proceed to Checkout",
              textStyle: AppText.h3b!.copyWith(color: Colors.white),
              onPressed: () {})
        ],
      ),
    );
  }
}
