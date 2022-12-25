part of 'list_product_sayur_bloc.dart';

@immutable
abstract class ListProductSayurState {}

class ListProductSayurInitial extends ListProductSayurState {}

class ListProductSayurIsLoading extends ListProductSayurState {}

class ListProductSayurIsFailed extends ListProductSayurState {
  final String message;
  ListProductSayurIsFailed({
    required this.message,
  });
}

class ListProductSayurIsSuccess extends ListProductSayurState {
  final List<ProductModel> products;
  ListProductSayurIsSuccess({
    required this.products,
  });
}
