// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUser extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  RegisterUser({
    required this.username,
    required this.email,
    required this.password,
  });
}
