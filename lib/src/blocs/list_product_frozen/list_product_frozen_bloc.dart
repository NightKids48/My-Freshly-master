import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

part 'list_product_frozen_event.dart';
part 'list_product_frozen_state.dart';

class ListProductFrozenBloc
    extends Bloc<ListProductFrozenEvent, ListProductFrozenState> {
  ListProductFrozenBloc() : super(ListProductFrozenInitial()) {
    on<FetchListProductFrozen>((event, emit) async {
      emit(ListProductFrozenIsLoading());
      final result = await ProductService().FetchListProductFrozen();
      emit(result.fold((l) => ListProductFrozenIsFailed(message: l),
          (r) => ListProductFrozenIsSuccess(data: r)));
    });
  }
}
