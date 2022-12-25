// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_order_bloc.dart';

@immutable
abstract class ListOrderState {}

class ListOrderInitial extends ListOrderState {}

class ListOrderIsLoading extends ListOrderState {}

class ListOrderIsSuccess extends ListOrderState {
  final List<OrderModel> model;
  ListOrderIsSuccess({
    required this.model,
  });
}

class ListOrderIsFailed extends ListOrderState {
  final String message;
  ListOrderIsFailed({
    required this.message,
  });
}
