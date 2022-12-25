part of 'cart_count_cubit.dart';

@immutable
abstract class CartCountState {}

class CartCountInitial extends CartCountState {}

class CartCountIsSuccess extends CartCountState {
  final int value;

  CartCountIsSuccess(this.value);
}

class CartCountIsFailed extends CartCountState {
  final String message;

  CartCountIsFailed(this.message);
}
