import 'package:bloc/bloc.dart';
import 'package:freshly/src/services/services.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'list_user_event.dart';
part 'list_user_state.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  ListUserBloc() : super(ListUserInitial()) {
    on<FetchListUser>((event, emit) async {
      emit(ListUserIsLoading());
      final result = await UserService().fetchAllUser();
      emit(
        result.fold(
          (l) => ListUserIsLoading(),
          (r) => ListUserIsSuccess(data: r),
        ),
      );
    });
  }
}
