// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartEvent {}

class AddToCart extends AddToCartEvent {
  final ProductModel data;

  // final int total;

  AddToCart(
    this.data,

    // this.total,
  );
}
