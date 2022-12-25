import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freshly/src/cubits/cubits.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final CheckSavedCubit checkSavedCubit;
  WishlistCubit(this.checkSavedCubit) : super(WishlistInitial());

  void addToWishList(ProductModel model) async {
    final result = await ProductService().addToWishlist(model);
    emit(result.fold((l) => WishlistIsFailed(l), (r) {
      checkSavedCubit.checkWishList(model.id!);
      return WishlistIsSuccess(r);
    }));
  }

  void removeFromWishList(String id) async {
    final result = await ProductService().removeFromWishlist(id);
    emit(result.fold((l) => WishlistIsFailed(l), (r) {
      checkSavedCubit.checkWishList(id);
      return WishlistIsSuccess(r);
    }));
  }
}
