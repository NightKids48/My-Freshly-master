// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'on_bayar_bloc.dart';

@immutable
abstract class OnBayarState {}

class OnBayarInitial extends OnBayarState {}

class OnBayarIsSuccess extends OnBayarState {
  final String message;
  OnBayarIsSuccess({
    required this.message,
  });
}

class OnBayarIsFailed extends OnBayarState {
  final String message;
  OnBayarIsFailed({
    required this.message,
  });
}

class OnBayarIsLoading extends OnBayarState {}
