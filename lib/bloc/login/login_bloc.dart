import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../services/auth_repository.dart';
import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_event.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.repository, required this.authenticationBloc})
      : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginLoading();
      try {
        final token = await repository.authenticate(
            username: event.username,
            password: event.password
        );
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
