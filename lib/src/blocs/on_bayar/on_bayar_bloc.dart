import 'package:bloc/bloc.dart';
import 'package:freshly/src/models/models.dart';
import 'package:meta/meta.dart';

import '../../services/services.dart';

part 'on_bayar_event.dart';
part 'on_bayar_state.dart';

class OnBayarBloc extends Bloc<OnBayarEvent, OnBayarState> {
  OnBayarBloc() : super(OnBayarInitial()) {
    on<OnBayarClick>((event, emit) async {
      emit(OnBayarIsLoading());
      final result = await OrderService().onBayar(event.data);
      emit(
        result.fold(
          (l) => OnBayarIsFailed(message: l),
          (r) => OnBayarIsSuccess(message: r),
        ),
      );
    });
  }
}
