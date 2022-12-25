import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';

part 'list_product_event.dart';
part 'list_product_state.dart';

class ListProductBloc extends Bloc<ListProductEvent, ListProductState> {
  ListProductBloc() : super(ListProductInitial()) {
    on<FetchListProduct>((event, emit) async {
      emit(ListProductIsLoading());
      final result = await ProductService().fetchListProduct();

      emit(result.fold((l) => ListProductIsFailed(message: l),
          (r) => ListProductIsSuccess(products: r)));
    });
  }
}
