import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../services/auth_repository.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final AuthRepository repository;
  LoginPage({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = LoginBloc(
        repository: repository,
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: BlocProvider(
        create: (BuildContext context) => loginBloc,
        child: LoginForm(),
      ),
    );
  }
}
