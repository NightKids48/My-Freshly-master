import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

part 'list_order_event.dart';
part 'list_order_state.dart';

class ListOrderBloc extends Bloc<ListOrderEvent, ListOrderState> {
  ListOrderBloc() : super(ListOrderInitial()) {
    on<FetchListOrder>((event, emit) async {
      emit(ListOrderIsLoading());
      final result = await OrderService().fetchListOrder();
      emit(
        result.fold(
          (l) => ListOrderIsFailed(message: l),
          (r) => ListOrderIsSuccess(model: r),
        ),
      );
    });
  }
}
