import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';

part 'list_wishlist_event.dart';
part 'list_wishlist_state.dart';

class ListWishlistBloc extends Bloc<ListWishlistEvent, ListWishlistState> {
  ListWishlistBloc() : super(ListWishlistInitial()) {
    on<FetchListWishlist>((event, emit) async {
      emit(ListWishlistIsLoading());
      final result = await ProductService().fetchListWishlist();

      emit(result.fold(
          (l) => ListWishlistIsFailed(l), (r) => ListWishlistIsSuccess(r)));
    });
  }
}
