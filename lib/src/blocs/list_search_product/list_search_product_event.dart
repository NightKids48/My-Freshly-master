// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_search_product_bloc.dart';

@immutable
abstract class ListSearchProductEvent {}

class FetchListProductSearch extends ListSearchProductEvent {
  final String? search;
  FetchListProductSearch({
    this.search,
  });
}
