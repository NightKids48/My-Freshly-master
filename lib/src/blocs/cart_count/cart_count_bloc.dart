import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_count_event.dart';
part 'cart_count_state.dart';

class CartCountBloc extends Bloc<CartCountEvent, CartCountBlocState> {
  CartCountBloc() : super(CartCountInitial()) {
    on<CartCountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
