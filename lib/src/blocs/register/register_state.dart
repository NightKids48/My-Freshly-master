// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterIsLoading extends RegisterState {}

class RegisterIsFailed extends RegisterState {
  final String message;
  RegisterIsFailed({
    required this.message,
  });
}

class RegisterIsSuccess extends RegisterState {
  final UserModel data;
  RegisterIsSuccess({
    required this.data,
  });
}
