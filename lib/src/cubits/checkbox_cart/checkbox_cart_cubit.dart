import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freshly/src/models/models.dart';

part 'checkbox_cart_state.dart';

class CheckboxCartCubit extends Cubit<CheckboxCartState> {
  CheckboxCartCubit() : super(CheckboxCartIsChecked([]));

  void addCheckBox(ProductModel model) {
    final data = <ProductModel>[];
    if ((state as CheckboxCartIsChecked).model.isNotEmpty) {
      data.addAll((state as CheckboxCartIsChecked).model);
    }
    data.add(model);
    emit(CheckboxCartIsChecked(data));
  }

  void removeCheckBox(ProductModel model) {
    final data = (state as CheckboxCartIsChecked).model;
    data.remove(model);
    emit(CheckboxCartIsChecked(data));
  }

  void removeAllCheckBox() {
    final data = (state as CheckboxCartIsChecked).model;
    data.clear();
    emit(CheckboxCartIsChecked(data));
  }

  void addAllCheckBox(List<ProductModel> models) {
    final data = <ProductModel>[];
    data.addAll(models);
    emit(CheckboxCartIsChecked(data));
  }
}
