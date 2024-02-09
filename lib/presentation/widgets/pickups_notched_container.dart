import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';

import '../../configs/configs.dart';
import '../../core/core.dart';

Widget pickupsNotchedContainer() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: AppDimensions.normalize(20),
        width: double.infinity,
        color: AppColors.deepRed,
        child: Row(
          children: [
            Space.xf(5),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoaded && state.pickUps.isNotEmpty) {
                  return Text(
                    "View Cart",
                    style: AppText.b1b?.copyWith(color: Colors.white),
                  );
                } else if (state is CartLoaded && state.pickUps.isEmpty) {
                  return Text(
                    "Empty Cart",
                    style: AppText.b1b?.copyWith(color: Colors.white),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            Space.xm!,
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoaded && state.pickUps.isNotEmpty) {
                  return Text(
                    "88888",
                    style: AppText.b1b?.copyWith(color: Colors.white),
                  );
                } else if (state is CartLoaded && state.pickUps.isEmpty) {
                  return Text(
                    "0.00 KWD",
                    style: AppText.b1b?.copyWith(color: Colors.white),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            Space.xf(2)
          ],
        ),
      ),
      Positioned(
        left: AppDimensions.normalize(8),
        bottom: AppDimensions.normalize(8),
        child: Container(
          height: AppDimensions.normalize(20),
          width: AppDimensions.normalize(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.deepRed,
              width: 2,
            ),
          ),
          child: Center(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoaded && state.pickUps.isNotEmpty) {
                  return Text(
                    state.pickUps.length.toString(),
                    style: AppText.h2b,
                  );
                } else if (state is CartLoaded && state.pickUps.isEmpty) {
                  return Text(
                    state.pickUps.length.toString(),
                    style: AppText.h2b,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      )
    ],
  );
}
