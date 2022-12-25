import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

part 'list_product_buah_event.dart';
part 'list_product_buah_state.dart';

class ListProductBuahBloc
    extends Bloc<ListProductBuahEvent, ListProductBuahState> {
  ListProductBuahBloc() : super(ListProductBuahInitial()) {
    on<FetchListProductBuah>((event, emit) async {
      emit(ListProductBuahIsLoading());
      final result = await ProductService().fetchListProductbuah();
      emit(result.fold((l) => ListProductBuahIsFailed(message: l),
          (r) => ListProductBuahIsSuccess(data: r)));
    });
  }
}
