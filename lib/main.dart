import 'package:auth_repository/auth_repository.dart';
import 'package:delivery_repository/delivery_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novapost/delivery/bloc/delivery_bloc.dart';
import 'package:novapost/home/home_page.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:provider/provider.dart';

import 'delivery/delivery_page.dart';
import 'login_page.dart';

void main() {
  final baseUrl = '';
  final authRepository = AuthRepositoryImpl(baseUrl: baseUrl);
  final profileRepository =  ProfileRepositoryImpl(authRepository: authRepository, baseUrl: baseUrl);
  final deliveryRepository = DeliveryRepositoryImpl(authRepository: authRepository, baseUrl: baseUrl);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DeliveryBloc>(
          create: (_) => DeliveryBloc(deliveryRepository),
        ),
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<DeliveryRepository>.value(
              value: deliveryRepository,
            ),
            RepositoryProvider<AuthRepository>.value(
              value: authRepository,
            ),
            RepositoryProvider<ProfileRepository>.value(
              value: profileRepository,
            ),
          ],
/*          child: MultiBlocProvider(
            providers: [
            ],
            child: NovaPostApp(),
          ),*/
          child: NovaPostApp(),
        ),
      ],
    ),
  );
}

class NovaPostApp extends StatelessWidget {
  const NovaPostApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'NovaPost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(133, 108, 60, 1),),
      ),
      home: const HomePage(),
    );
  }
}

