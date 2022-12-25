// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_order_bloc.dart';

@immutable
abstract class AddToOrderEvent {}

class OrderRequest extends AddToOrderEvent {
  final double totalPrice;
  final List<ProductModel> products;
  OrderRequest(
    this.totalPrice,
    this.products,
  );
}
