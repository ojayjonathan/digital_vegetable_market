import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/data/services/status.dart';
import 'package:market/resources/info.dart';
import 'package:flutter/cupertino.dart';

part "state.dart";

class ResetPasswordBloc extends Cubit<ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordState());
  final formKey = GlobalKey<FormState>();
  emailChanged(String value) {
    emit(
      state.copyWith(email: value),
    );
  }

  passwordChanged(String value) {
    emit(
      state.copyWith(newPassword: value),
    );
  }

  resetCodehanged(String value) {
    emit(
      state.copyWith(resetCode: value),
    );
  }

  submitForm() async {
    if (formKey.currentState?.validate() == true) {
      emit(
        state.copyWith(
            message: const InfoMessage(
              message: "Please wait...",
              type: MessageType.success,
            ),
            status: ServiceStatus.submissionInProgress),
      );
      if (state.step == PasswordResetStep.one) {
        await passwordResetInit();
      } else {
        await passwordResetComplete();
      }
    }
  }

  passwordResetInit() async {
    final res = await service<UserAccount>().passwordResetInit(state.email!);
    res.when(
      onError: (error) {
        emit(
          state.copyWith(
            status: ServiceStatus.loadingFailure,
            message: InfoMessage.fromError(error),
          ),
        );
      },
      onSuccess: (data) {
        emit(
          state.copyWith(
            step: PasswordResetStep.two,
            status: ServiceStatus.submissionSuccess,
            message: InfoMessage(
              message: "Password reset code has been send to ${state.email}",
              type: MessageType.success,
            ),
          ),
        );
      },
    );
  }

  passwordResetComplete() async {
    final res = await service<UserAccount>().passwordResetComplete(
      state.resetCode!,
      state.newPassword!,
    );
    res.when(
      onError: (error) {
        emit(
          state.copyWith(
            status: ServiceStatus.loadingFailure,
            message: InfoMessage.fromError(error),
          ),
        );
      },
      onSuccess: (data) {
        emit(
          state.copyWith(
            status: ServiceStatus.submissionSuccess,
            message: const InfoMessage(
              message: "Password changed, proceed to login",
              type: MessageType.success,
            ),
          ),
        );
      },
    );
  }
}
