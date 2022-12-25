import 'package:bloc/bloc.dart';
import 'package:freshly/src/blocs/blocs.dart';
import 'package:freshly/src/models/models.dart';
import 'package:meta/meta.dart';

import '../../services/services.dart';

part 'list_product_ikan_event.dart';
part 'list_product_ikan_state.dart';

class ListProductIkanBloc
    extends Bloc<ListProductIkanEvent, ListProductIkanState> {
  ListProductIkanBloc() : super(ListProductIkanInitial()) {
    on<FetchListProductIkan>((event, emit) async {
      emit(ListProductIkanIsLoading());
      final result = await ProductService().fetchListProductIkan();
      emit(
        result.fold(
          (l) => ListProductIkanIsFailed(message: l),
          (r) => ListProductIkanIsSuccess(products: r),
        ),
      );
    });
  }
}
