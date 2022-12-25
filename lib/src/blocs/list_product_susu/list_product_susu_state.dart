// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_susu_bloc.dart';

@immutable
abstract class ListProductSusuState {}

class ListProductSusuInitial extends ListProductSusuState {}

class ListProductSusuIsLoading extends ListProductSusuState {}

class ListProductSusuIsFailed extends ListProductSusuState {
  final String message;
  ListProductSusuIsFailed({
    required this.message,
  });
}

class ListProductSusuIsSuccess extends ListProductSusuState {
  final List<ProductModel> products;
  ListProductSusuIsSuccess({
    required this.products,
  });
}
