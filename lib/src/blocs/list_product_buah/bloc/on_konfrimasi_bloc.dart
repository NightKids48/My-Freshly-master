import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_konfrimasi_event.dart';
part 'on_konfrimasi_state.dart';

class OnKonfrimasiBloc extends Bloc<OnKonfrimasiEvent, OnKonfrimasiState> {
  OnKonfrimasiBloc() : super(OnKonfrimasiInitial()) {
    on<OnKonfrimasiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
