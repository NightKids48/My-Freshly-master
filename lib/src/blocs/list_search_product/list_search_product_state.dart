// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_search_product_bloc.dart';

@immutable
abstract class ListSearchProductState {}

class ListSearchProductInitial extends ListSearchProductState {}

class ListSearchProductIsLoading extends ListSearchProductState {}

class ListSearchProductIsFailed extends ListSearchProductState {
  final String message;
  ListSearchProductIsFailed({
    required this.message,
  });
}

class ListSearchProductIsSuccess extends ListSearchProductState {
  final List<ProductModel> data;
  ListSearchProductIsSuccess({
    required this.data,
  });
}
