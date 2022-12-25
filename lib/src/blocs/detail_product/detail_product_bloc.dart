import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  DetailProductBloc() : super(DetailProductInitial()) {
    on<FetchDetailProduct>((event, emit) async {
      emit(DetailProductIsLoading());
      final result = await ProductService().fetchDetailProduct(event.docId);

      emit(result.fold((l) => DetailProductIsFailed(message: l),
          (r) => DetailProductIsSuccess(data: r)));
    });
  }
}
