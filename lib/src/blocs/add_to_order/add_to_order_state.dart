// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_order_bloc.dart';

@immutable
abstract class AddToOrderState {}

class AddToOrderInitial extends AddToOrderState {}

class AddToOrderIsLoading extends AddToOrderState {}

class AddToOrderIsSuccess extends AddToOrderState {
  final String message;
  AddToOrderIsSuccess(
    this.message,
  );
}

class AddToOrderIsFailed extends AddToOrderState {
  final String message;
  AddToOrderIsFailed(
    this.message,
  );
}
