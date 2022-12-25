// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_buah_bloc.dart';

@immutable
abstract class ListProductBuahState {}

class ListProductBuahInitial extends ListProductBuahState {}

class ListProductBuahIsLoading extends ListProductBuahState {}

class ListProductBuahIsFailed extends ListProductBuahState {
  final String message;
  ListProductBuahIsFailed({
    required this.message,
  });
}

class ListProductBuahIsSuccess extends ListProductBuahState {
  final List<ProductModel> data;
  ListProductBuahIsSuccess({
    required this.data,
  });
}
