// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_bumbu_bloc.dart';

@immutable
abstract class ListProductBumbuState {}

class ListProductBumbuInitial extends ListProductBumbuState {}

class ListProductBumbuIsLoading extends ListProductBumbuState {}

class ListProductBumbuIsFailed extends ListProductBumbuState {
  final String message;
  ListProductBumbuIsFailed({
    required this.message,
  });
}

class ListProductBumbuIsSuccess extends ListProductBumbuState {
  final List<ProductModel> data;
  ListProductBumbuIsSuccess({
    required this.data,
  });
}
