import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freshly/src/models/models.dart';
import 'package:freshly/src/services/services.dart';
import 'package:freshly/src/utilities/utilities.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(RegisterIsLoading());
      final result = await UserService().registerWithEmail(
          email: event.email, name: event.username, password: event.password);
      emit(
        result.fold(
          (l) => RegisterIsFailed(message: l),
          (r) {
            Commons().setUID(r.uid!);
            return RegisterIsSuccess(data: r);
          },
        ),
      );
    });
  }
}
