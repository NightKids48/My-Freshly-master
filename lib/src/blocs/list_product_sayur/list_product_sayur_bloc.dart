import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'list_product_sayur_event.dart';
part 'list_product_sayur_state.dart';

class ListProductSayurBloc
    extends Bloc<ListProductSayurEvent, ListProductSayurState> {
  ListProductSayurBloc() : super(ListProductSayurInitial()) {
    on<FetchListProductSayur>((event, emit) async {
      emit(ListProductSayurIsLoading());
      final result = await ProductService().fetchListProductSayur();
      emit(
        result.fold(
          (l) => ListProductSayurIsFailed(message: l),
          (r) => ListProductSayurIsSuccess(products: r),
        ),
      );
    });
  }
}
