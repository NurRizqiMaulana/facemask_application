import 'package:facemask_application/bloc/artikel/artikel_bloc.dart';
import 'package:facemask_application/bloc/change_password/change_password_bloc.dart';
import 'package:facemask_application/bloc/login/login_bloc.dart';
import 'package:facemask_application/bloc/profile/profile_bloc.dart';
import 'package:facemask_application/bloc/register/register_bloc.dart';
import 'package:facemask_application/data/datasources/artikel_datasources.dart';
import 'package:facemask_application/data/datasources/auth_datasources.dart';
import 'package:facemask_application/presentation/pages/home_page.dart';
import 'package:facemask_application/presentation/pages/auth/login_page.dart';
import 'package:facemask_application/presentation/pages/onboarding_page.dart';
import 'package:facemask_application/presentation/pages/profile/profile_page.dart';
import 'package:facemask_application/presentation/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ChangePasswordBloc(AuthDatasource()),
        ),
        // BlocProvider(
        //   create: (context) => CreateProductBloc(ProductDatasources()),
        // ),
        BlocProvider(
          create: (context) => ArtikelBloc(ArtikelDatasources()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
