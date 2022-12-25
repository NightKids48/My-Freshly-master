import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_variant_state.dart';

class CheckVariantCubit extends Cubit<CheckVariantState> {
  CheckVariantCubit() : super(CheckVariantIsSelected(''));

  void selectItem(String newString) {
    String listData = (state as CheckVariantIsSelected).selectedVariant;
    if (!listData.contains(newString)) {
      listData = newString;
    } else {
      listData = '';
    }
    emit(CheckVariantIsSelected(listData));
  }
}
