// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_frozen_bloc.dart';

@immutable
abstract class ListProductFrozenState {}

class ListProductFrozenInitial extends ListProductFrozenState {}

class ListProductFrozenIsLoading extends ListProductFrozenState {}

class ListProductFrozenIsFailed extends ListProductFrozenState {
  final String message;
  ListProductFrozenIsFailed({
    required this.message,
  });
}

class ListProductFrozenIsSuccess extends ListProductFrozenState {
  final List<ProductModel> data;
  ListProductFrozenIsSuccess({
    required this.data,
  });
}
