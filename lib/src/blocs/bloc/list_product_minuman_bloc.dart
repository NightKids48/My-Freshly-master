import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

part 'list_product_minuman_event.dart';
part 'list_product_minuman_state.dart';

class ListProductMinumanBloc
    extends Bloc<ListProductMinumanEvent, ListProductMinumanState> {
  ListProductMinumanBloc() : super(ListProductMinumanInitial()) {
    on<FetchListProductMinuman>((event, emit) async {
      emit(ListProductMinumanIsLoading());
      final result = await ProductService().FetchListProductMinuman();
      emit(
        result.fold(
          (l) => ListProductMinumanIsFailed(message: l),
          (r) => ListProductMinumanIsSuccess(products: r),
        ),
      );
    });
  }
}
