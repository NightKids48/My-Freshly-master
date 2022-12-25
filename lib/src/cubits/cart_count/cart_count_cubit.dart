import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freshly/src/services/services.dart';

part 'cart_count_state.dart';

class CartCountCubit extends Cubit<CartCountState> {
  CartCountCubit() : super(CartCountIsSuccess(0));

  void getCartCount() async {
    final result = await ProductService().getCartItemCount();
    emit(
        result.fold((l) => CartCountIsFailed(l), (r) => CartCountIsSuccess(r)));
  }
}
