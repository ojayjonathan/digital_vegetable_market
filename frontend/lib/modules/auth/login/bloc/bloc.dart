import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:vegetable_marketplace/data_provider/repository/auth.dart';
import 'package:vegetable_marketplace/modules/auth/models/form_input.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState());
  final AuthRepository _authRepository;

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate([
          state.phoneNumber,
          password,
        ]),
        password: password,
      ),
    );
  }

  void phoneChanged(String value) {
    final phone = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
          status: Formz.validate([
            state.password,
            phone,
          ]),
          phoneNumber: phone),
    );
  }

  void login() {
    if (state.status.isValid) {
      emit(
        state.copyWith(status: FormzStatus.submissionInProgress),
      );
      _authRepository
          .login(
            password: state.password.value,
            phoneNumber: state.phoneNumber.value,
          )
          .then(
            (value) => null,
          );
    }
  }
}
