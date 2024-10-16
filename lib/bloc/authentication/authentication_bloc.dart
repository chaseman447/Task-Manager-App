import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../services/auth_repository.dart';
import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository repository;
  AuthenticationBloc(super.initialState,  {required this.repository}) : assert(repository != null);
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    // Handle AppStarted event
    if(event is AppStarted){
      yield AuthenticationLoading();
      final bool hasToken = await repository.hasToken();
      if(hasToken){
        yield AuthenticationAuthenticated();
      }
      else{
        yield AuthenticationUnauthenticated();
      }
    }

    // Handle LoggedIn event
    if(event is LoggedIn){
      yield AuthenticationLoading();
      await repository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    // Handle LoggedOut event
    if(event is LoggedOut){
      yield AuthenticationLoading();
      await repository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
