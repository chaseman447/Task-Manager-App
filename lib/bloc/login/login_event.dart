import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent([List<Object> props = const []]);

  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressedEvent({
    required this.username,
    required this.password,
  }) ;

  @override
  String toString() => 'LoginButtonPressedEvent(username: $username, password: $password)';
}
