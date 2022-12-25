import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

part 'list_product_bumbu_event.dart';
part 'list_product_bumbu_state.dart';

class ListProductBumbuBloc
    extends Bloc<ListProductBumbuEvent, ListProductBumbuState> {
  ListProductBumbuBloc() : super(ListProductBumbuInitial()) {
    on<FetchListProductBumbu>((event, emit) async {
      emit(ListProductBumbuIsLoading());
      final result = await ProductService().FetchListProductBumbu();
      emit(result.fold((l) => ListProductBumbuIsFailed(message: l),
          (r) => ListProductBumbuIsSuccess(data: r)));
    });
  }
}
