// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUser extends LoginEvent {
  final String email;
  final String password;
  LoginUser({
    required this.email,
    required this.password,
  });
}
