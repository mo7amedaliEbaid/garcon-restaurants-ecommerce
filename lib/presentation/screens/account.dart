import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
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
            padding: Space.all(1.2, .5),
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
                  Space.yf(.2),
                  Text(
                    state.user.userName.capitalize(),
                    style: AppText.h1b,
                  ),
                  Text(
                    state.user.email,
                    style: AppText.b2b?.copyWith(color: AppColors.greyColor),
                  ),
                  Space.yf(.6),
                  Text(
                    state.user.phoneNumber,
                    style: AppText.b1b?.copyWith(color: AppColors.greyColor),
                  ),
                  Space.yf(2.6),
                  accountRow(
                      title: "Edit Profile",
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRouter.editProfile,
                          arguments: state.user,
                        );
                      }),
                  Space.y!,
                  Divider(
                    color: AppColors.greyColor.withOpacity(.4),
                  ),
                  Space.y!,
                  accountRow(
                      title: "Change Password",
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRouter.changePassword);
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
