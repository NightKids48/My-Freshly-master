// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_product_bloc.dart';

@immutable
abstract class DetailProductState {}

class DetailProductInitial extends DetailProductState {}

class DetailProductIsLoading extends DetailProductState {}

class DetailProductIsSuccess extends DetailProductState {
  final ProductModel data;
  DetailProductIsSuccess({
    required this.data,
  });
}

class DetailProductIsFailed extends DetailProductState {
  final String message;
  DetailProductIsFailed({
    required this.message,
  });
}
