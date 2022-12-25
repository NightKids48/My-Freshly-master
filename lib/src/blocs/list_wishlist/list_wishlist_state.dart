part of 'list_wishlist_bloc.dart';

@immutable
abstract class ListWishlistState {}

class ListWishlistInitial extends ListWishlistState {}

class ListWishlistIsLoading extends ListWishlistState {}

class ListWishlistIsSuccess extends ListWishlistState {
  final List<ProductModel> data;

  ListWishlistIsSuccess(this.data);
}

class ListWishlistIsFailed extends ListWishlistState {
  final String message;

  ListWishlistIsFailed(this.message);
}
