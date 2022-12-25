// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_product_minuman_bloc.dart';

@immutable
abstract class ListProductMinumanState {}

class ListProductMinumanInitial extends ListProductMinumanState {}

class ListProductMinumanIsLoading extends ListProductMinumanState {}

class ListProductMinumanIsFailed extends ListProductMinumanState {
  final String message;
  ListProductMinumanIsFailed({
    required this.message,
  });
}

class ListProductMinumanIsSuccess extends ListProductMinumanState {
  final List<ProductModel> products;
  ListProductMinumanIsSuccess({
    required this.products,
  });
}
