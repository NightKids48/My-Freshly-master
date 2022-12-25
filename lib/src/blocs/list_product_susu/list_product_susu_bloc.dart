import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

part 'list_product_susu_event.dart';
part 'list_product_susu_state.dart';

class ListProductSusuBloc
    extends Bloc<ListProductSusuEvent, ListProductSusuState> {
  ListProductSusuBloc() : super(ListProductSusuInitial()) {
    on<FetchListProductSusu>((event, emit) async {
      emit(ListProductSusuIsLoading());
      final result = await ProductService().FetchListProductSusu();
      emit(
        result.fold(
          (l) => ListProductSusuIsFailed(message: l),
          (r) => ListProductSusuIsSuccess(products: r),
        ),
      );
    });
  }
}
