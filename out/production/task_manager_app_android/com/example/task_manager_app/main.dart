import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/authentication/authentication_event.dart';
import 'bloc/authentication/authentication_state.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';
import 'services/auth_repository.dart';


void main() {
  final AuthRepository authRepository = AuthRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        repository: authRepository,
      )..add(AppStarted()),
      child: MyApp(repository: authRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository repository;
  MyApp({required this.repository});


  @override
  Widget build(BuildContext context) {
    //final authenticationBloc = AuthenticationBloc(repository: repository);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Auth App',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: BlocBuilder(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (context,state){
          if(state is AuthenticationAuthenticated){
            return HomePage();
          }
          if(state is AuthenticationUnauthenticated){
            return LoginPage(repository: repository);
          }
          if(state is AuthenticationLoading){
            return Center(child: CircularProgressIndicator());
          }
          return SplashPage();

        },
      ),
    );
  }
}
