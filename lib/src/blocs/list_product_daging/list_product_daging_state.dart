// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_daging_bloc.dart';

@immutable
abstract class ListProductDagingState {}

class ListProductDagingInitial extends ListProductDagingState {}

class ListProductDagingIsSuccess extends ListProductDagingState {
  final List<ProductModel> data;
  ListProductDagingIsSuccess({
    required this.data,
  });
}

class ListProductDagingIsLoading extends ListProductDagingState {}

class ListProductDagingIsFailed extends ListProductDagingState {
  final String message;
  ListProductDagingIsFailed({
    required this.message,
  });
}
