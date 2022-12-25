// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'on_konfrimasi_bloc.dart';

@immutable
abstract class OnKonfrimasiState {}

class OnKonfrimasiInitial extends OnKonfrimasiState {}

class OnKonfrimasiIsSuccess extends OnKonfrimasiState {
  final String message;
  OnKonfrimasiIsSuccess({
    required this.message,
  });
}

class OnKonfrimasiIsLoading extends OnKonfrimasiState {}

class OnKonfrimasiIsFailed extends OnKonfrimasiState {
  final String message;
  OnKonfrimasiIsFailed({
    required this.message,
  });
}
