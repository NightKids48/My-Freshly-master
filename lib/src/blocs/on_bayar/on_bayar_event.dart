// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'on_bayar_bloc.dart';

@immutable
abstract class OnBayarEvent {}

class OnBayarClick extends OnBayarEvent {
  final OrderModel data;
  OnBayarClick({
    required this.data,
  });
}
