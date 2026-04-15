part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent{
  final String email;
  final String password;
  AuthLoginRequested({required this.password,required this.email});

}

