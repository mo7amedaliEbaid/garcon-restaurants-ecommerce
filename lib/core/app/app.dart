import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/repositories/repositories.dart';
import '../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
              firebaseAuth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance),
        ),
        RepositoryProvider(
          create: (context) =>
              UserRepository(firebaseFirestore: FirebaseFirestore.instance),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(InitializeAuthEvent()),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => UserBloc(
              authBloc: context.read<AuthBloc>(),
              userRepository: context.read<UserRepository>(),
            )..add(StartUserEvent()),
          ),
          BlocProvider(
            create: (context) =>
                SignUpBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SignInBloc(authRepository: context.read<AuthRepository>()),
          ),
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
          BlocProvider(create: (context) => SelectTagCubit()),
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
      ),
    );
  }
}
