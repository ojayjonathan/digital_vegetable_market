import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/domain/form_input.dart';
import 'package:market/data/error/error_object.dart';
import 'package:market/data/services/service.dart';
import 'package:market/resources/info.dart';
import 'package:market/data/models/user/user.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:formz/formz.dart';

part "state.dart";

class RegisterCupit extends Cubit<RegisterState> {
  RegisterCupit() : super(const RegisterState());
  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate(
          [state.email, state.firstName, password, state.lastName, state.phone],
        ),
        password: password,
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate(
            [email, state.firstName, state.password, state.lastName]),
        email: email,
      ),
    );
  }

  void phoneChanged(String value) {
    final phone = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate([
          phone,
          state.email,
          state.firstName,
          state.password,
          state.lastName
        ]),
        phone: phone,
      ),
    );
  }

  void firstNameChanged(String value) {
    final name = TextInput.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate(
          [state.phone, state.email, name, state.password, state.lastName],
        ),
        firstName: name,
      ),
    );
  }

  void lastNameChanged(String value) {
    final name = TextInput.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate(
          [state.email, state.firstName, state.password, name, state.phone],
        ),
        lastName: name,
      ),
    );
  }

  void passwordRegister() async {
    if (state.status.isValidated) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionInProgress,
          message: const InfoMessage(
            message: "Registering please wait...",
            type: MessageType.success,
          ),
        ),
      );
      final res = await service<UserAccount>().register(
        UserCreate(
          isFarmer: false,
          phoneNumber: state.email.value,
          firstName: state.firstName.value,
          lastName: state.lastName.value,
          password: state.password.value,
          email: state.email.value,
        ),
      );
      res.when(
        onError: (error) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              fieldError: error.fieldErrors,
              message: InfoMessage.fromError(error),
            ),
          );
        },
        onSuccess: (data) async {
          emit(
            state.copyWith(
              status: FormzStatus.submissionSuccess,
              message: InfoMessage(
                message: data.message,
                type: MessageType.success,
              ),
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(status: FormzStatus.invalid),
      );
    }
  }
}
