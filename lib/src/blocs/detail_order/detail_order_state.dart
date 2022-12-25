// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_order_bloc.dart';

@immutable
abstract class DetailOrderState {}

class DetailOrderInitial extends DetailOrderState {}

class DetailOrderIsSuccess extends DetailOrderState {
  final OrderModel model;
  DetailOrderIsSuccess({
    required this.model,
  });
}

class DetailOrderIsFailed extends DetailOrderState {
  final String message;
  DetailOrderIsFailed(this.message);
}

class DetailOrderIsLoading extends DetailOrderState {}
