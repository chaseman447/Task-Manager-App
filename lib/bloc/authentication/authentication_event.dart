import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent([List<Object> props = const []]);

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  const AppStarted() : super();

  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  String toString() => 'LoggedIn(token: $token)';
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut() : super();

  @override
  String toString() => 'LoggedOut';
}

