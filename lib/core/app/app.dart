import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/repositories/repositories.dart';
import '../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConnectivityCubit()),
        BlocProvider(
            lazy: false,
            create: (context) =>
                RestaurantsBloc(restaurantsRepository: RestaurantsRepo())
                  ..add(LoadRestaurants())),
        BlocProvider(
            create: (context) => FilterCubit(repository: RestaurantsRepo())),
        BlocProvider(
            lazy: false,
            create: (context) =>
                TagsBloc(restaurantsRepository: RestaurantsRepo())
                  ..add(LoadTags())),
      ],
      child: MaterialApp(
        title: 'Garcon',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splash,
        theme: ThemeData(
          fontFamily: AppStrings.fontFamily,
        ),
      ),
    );
  }
}
