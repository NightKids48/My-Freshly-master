// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_bloc.dart';

@immutable
abstract class ListProductState {}

class ListProductInitial extends ListProductState {}

class ListProductIsLoading extends ListProductState {}

class ListProductIsFailed extends ListProductState {
  final String message;
  ListProductIsFailed({
    required this.message,
  });
}

class ListProductIsSuccess extends ListProductState {
  final List<ProductModel> products;
  ListProductIsSuccess({
    required this.products,
  });
}
