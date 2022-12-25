import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterFilled(val: 1));
  void counterIncrement(int newval) {
    emit((state is CounterFilled)
        ? CounterFilled(val: (state as CounterFilled).val + newval)
        : CounterFilled(val: 0));
  }
}
