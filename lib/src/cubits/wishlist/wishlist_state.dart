part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistIsSuccess extends WishlistState {
  final String message;

  WishlistIsSuccess(this.message);
}

class WishlistIsFailed extends WishlistState {
  final String message;

  WishlistIsFailed(this.message);
}
