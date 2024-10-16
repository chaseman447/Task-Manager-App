import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    void _onLoginButtonPressed() {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      if (_formKey.currentState!.validate()) {
        try {
          loginBloc.add(LoginButtonPressedEvent(
            username: username,
            password: password,
          ));
        } catch (e) {
        }
      }
    }


    return BlocListener(
      bloc: loginBloc,
      listener: (context, state) {
        if (state != null && state is LoginFailure) {
          final errorMessage = state.error ?? 'No error message';
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder(
        bloc: loginBloc,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'username'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'password'),
                ),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed:_onLoginButtonPressed,
                  child: Text("Login"),
                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : null,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
