import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'list_order_admin_event.dart';
part 'list_order_admin_state.dart';

class ListOrderAdminBloc
    extends Bloc<ListOrderAdminEvent, ListOrderAdminState> {
  ListOrderAdminBloc() : super(ListOrderAdminInitial()) {
    on<FetchLAdministOrderAll>((event, emit) async {
      emit(ListOrderAdminIsLoading());
      final result = await OrderService().fetchListOrderAll();
      emit(
        result.fold(
          (l) => ListOrderAdminIsFailed(message: l),
          (r) => ListOrderAdminIsSuccess(model: r),
        ),
      );
    });
  }
}
