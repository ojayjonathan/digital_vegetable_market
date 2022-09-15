import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/domain/form_input.dart';
import 'package:market/presentation/features/account/bloc/bloc.dart';
import 'package:market/resources/info.dart';
import 'package:formz/formz.dart';

part "state.dart";

class AccountUpdateCupit extends Cubit<AccountUpdateState> {
  AccountBloc accountBloc;
  AccountUpdateCupit(this.accountBloc)
      : super(
          AccountUpdateState(
            email: Email.pure(accountBloc.state.user?.email ?? ""),
            firstName: TextInput.pure(accountBloc.state.user?.firstName ?? ""),
            lastName: TextInput.pure(accountBloc.state.user?.lastName ?? ""),
          ),
        );

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate([email, state.firstName, state.lastName]),
        email: email,
      ),
    );
  }

  void firstNameChanged(String value) {
    final name = TextInput.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate([name, state.lastName, state.email]),
        firstName: name,
      ),
    );
  }

  void lastNameChanged(String value) {
    final name = TextInput.dirty(value);
    emit(
      state.copyWith(
        status: Formz.validate([name, state.firstName, state.email]),
        lastName: name,
      ),
    );
  }

  updateProfile() async {
    if (state.status.isValidated) {
      final user = accountBloc.state.user!.copyWith(
        firstName: state.firstName.value,
        email: state.email.value,
        lastName: state.lastName.value,
      );
      accountBloc.add(AccountUpdated(user));
    } else {
      emit(state.copyWith(status: FormzStatus.invalid));
    }
  }
}
