import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/app_dimensions.dart';
import 'package:garcon/configs/space.dart';
import 'package:garcon/presentation/widgets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: "My Account", isWithArrow: false),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Padding(
            padding: Space.v!,
            child: Center(
              child: Column(
                children: [
                  Space.yf(2.5),
                  Flag.fromString(
                    state.user.country,
                    height: AppDimensions.normalize(14),
                    width: AppDimensions.normalize(14),
                    fit: BoxFit.fill,
                    flagSize: FlagSize.size_1x1,
                    borderRadius: AppDimensions.normalize(10),
                  ),
                  Space.yf(.5),
                  Text(state.user.email),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
