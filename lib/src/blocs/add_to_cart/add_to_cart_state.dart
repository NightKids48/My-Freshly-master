part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartIsLoading extends AddToCartState {}

class AddToCartIsSuccess extends AddToCartState {
  final String message;

  AddToCartIsSuccess(this.message);
}

class AddToCartIsFailed extends AddToCartState {
  final String message;

  AddToCartIsFailed(this.message);
}
