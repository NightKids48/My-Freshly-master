// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginIsLoading extends LoginState {}

class LoginIsFailed extends LoginState {
  final String message;
  LoginIsFailed({
    required this.message,
  });
}

class LoginIsSuccess extends LoginState {}
