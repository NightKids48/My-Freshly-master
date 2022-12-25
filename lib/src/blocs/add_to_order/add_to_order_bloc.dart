import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:freshly/src/utilities/utilities.dart';
import 'package:meta/meta.dart';

part 'add_to_order_event.dart';
part 'add_to_order_state.dart';

class AddToOrderBloc extends Bloc<AddToOrderEvent, AddToOrderState> {
  AddToOrderBloc() : super(AddToOrderInitial()) {
    on<OrderRequest>((event, emit) async {
      emit(AddToOrderIsLoading());
      OrderModel orderModel = OrderModel(
          uid: await Commons().getUID(),
          dateTime: DateTime.now(),
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          paymentStatus: 0,
          productName: 'Belanja',
          totalPrice: event.totalPrice,
          products: event.products);
      final result = await OrderService().orderProcess(orderModel);

      emit(result.fold(
          (l) => AddToOrderIsFailed(l), (r) => AddToOrderIsSuccess(r)));
    });
  }
}
