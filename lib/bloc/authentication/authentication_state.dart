import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState([List<Object> props = const []]);

  @override
  List<Object> get props => [];
}
class AuthenticationInitial extends AuthenticationState {}

class AuthenticationUninitialized extends AuthenticationState {
  const AuthenticationUninitialized() : super();

  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated() : super();

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  const AuthenticationUnauthenticated() : super();

  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading() : super();

  @override
  String toString() => 'AuthenticationLoading';
}