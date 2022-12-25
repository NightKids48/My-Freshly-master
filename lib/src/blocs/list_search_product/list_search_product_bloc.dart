import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

part 'list_search_product_event.dart';
part 'list_search_product_state.dart';

class ListSearchProductBloc
    extends Bloc<ListSearchProductEvent, ListSearchProductState> {
  ListSearchProductBloc() : super(ListSearchProductInitial()) {
    on<FetchListProductSearch>((event, emit) async {
      emit(ListSearchProductIsLoading());
      final result =
          await ProductService().fetchListProductSearch(event.search!);
      emit(
        result.fold(
          (l) => ListSearchProductIsFailed(message: l),
          (r) => ListSearchProductIsSuccess(data: r),
        ),
      );
    });
  }
}
