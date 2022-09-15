import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/domain/form_input.dart';
import 'package:market/data/repository/app.dart';
import 'package:market/data/services/service.dart';
import 'package:market/resources/info.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/utils/utils.dart';
import 'package:formz/formz.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());
  final AppRepository _authenticationRepository;

  passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate([
          state.phone,
          password,
        ]),
        password: password,
      ),
    );
  }

  phoneChanged(String value) {
    final phone = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
          status: Formz.validate([
            state.password,
            phone,
          ]),
          phone: phone),
    );
  }

  rememberMeChanged(bool value) {
    emit(
      state.copyWith(rememberMe: value),
    );
  }

  passwordLogin() async {
    if (state.status.isValidated) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionInProgress,
          message: const InfoMessage(
            message: "Submiting, please wait...",
            type: MessageType.success,
          ),
        ),
      );
      final res = await service<UserAccount>().login(
        phone: state.phone.value,
        password: state.password.value,
      );
      res.when(
        onError: (error) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              message: InfoMessage.fromError(error),
            ),
          );
        },
        onSuccess: (token) async {
          emit(
            state.copyWith(
              status: FormzStatus.submissionSuccess,
              message: const InfoMessage(
                message: "Login successfuly",
                type: MessageType.success,
              ),
            ),
          );
          await storeAuthToken(token);
          _authenticationRepository.login(token);
        },
      );
    } else {
      emit(
        state.copyWith(status: FormzStatus.invalid),
      );
    }
  }
}
