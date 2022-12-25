import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarIsChanged(index: 0));

  void changeIndex(int newIndex) {
    emit(BottomNavBarIsChanged(index: newIndex));
  }
}
