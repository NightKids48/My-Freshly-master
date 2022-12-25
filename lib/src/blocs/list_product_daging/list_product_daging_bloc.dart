import 'package:bloc/bloc.dart';
import 'package:freshly/src/services/services.dart';
import 'package:freshly/src/utilities/utilities.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'list_product_daging_event.dart';
part 'list_product_daging_state.dart';

class ListProductDagingBloc
    extends Bloc<ListProductDagingEvent, ListProductDagingState> {
  ListProductDagingBloc() : super(ListProductDagingInitial()) {
    on<FetchListProductDaging>((event, emit) async {
      emit(ListProductDagingIsLoading());

      final result = await ProductService().fetchListProductDaging();
      emit(
        result.fold(
          (l) => ListProductDagingIsFailed(message: l),
          (r) => ListProductDagingIsSuccess(data: r),
        ),
      );
    });
  }
}
