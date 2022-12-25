// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_ikan_bloc.dart';

@immutable
abstract class ListProductIkanState {}

class ListProductIkanInitial extends ListProductIkanState {}

class ListProductIkanIsLoading extends ListProductIkanState {}

class ListProductIkanIsSuccess extends ListProductIkanState {
  final List<ProductModel> products;
  ListProductIkanIsSuccess({
    required this.products,
  });
}

class ListProductIkanIsFailed extends ListProductIkanState {
  final String message;
  ListProductIkanIsFailed({
    required this.message,
  });
}
