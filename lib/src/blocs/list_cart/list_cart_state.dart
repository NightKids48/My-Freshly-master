part of 'list_cart_bloc.dart';

@immutable
abstract class ListCartState {}

class ListCartInitial extends ListCartState {}

class ListCartIsFailed extends ListCartState {
  final String message;

  ListCartIsFailed(this.message);
}

class ListCartIsSuccess extends ListCartState {
  final List<ProductModel> data;
  final List<ProductModel> retrainData;

  ListCartIsSuccess(this.data, this.retrainData);
}

class ListCartIsLoading extends ListCartState {}
