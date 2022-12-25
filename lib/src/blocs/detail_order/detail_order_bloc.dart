import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'detail_order_event.dart';
part 'detail_order_state.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {
  DetailOrderBloc() : super(DetailOrderInitial()) {
    on<FetchDetailOrder>((event, emit) async {
      // TODO: implement event handler
      emit(DetailOrderIsLoading());
      final result = await OrderService().fetchDetailOrder(event.docId);
      emit(result.fold((l) => DetailOrderIsFailed(l),
          (r) => DetailOrderIsSuccess(model: r)));
    });
  }
}
