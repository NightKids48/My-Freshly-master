import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'on_konfrimasi_event.dart';
part 'on_konfrimasi_state.dart';

class OnKonfrimasiBloc extends Bloc<OnKonfrimasiEvent, OnKonfrimasiState> {
  OnKonfrimasiBloc() : super(OnKonfrimasiInitial()) {
    on<OnClickKonfrimasi>((event, emit) async {
      emit(OnKonfrimasiIsLoading());
      final result = await OrderService().onKonfrimasi(event.data);
      emit(
        result.fold(
          (l) => OnKonfrimasiIsFailed(message: l),
          (r) => OnKonfrimasiIsSuccess(message: r),
        ),
      );
    });
  }
}
