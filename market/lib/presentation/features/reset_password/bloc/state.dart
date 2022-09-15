part of "bloc.dart";

enum PasswordResetStep { one, two }

class ResetPasswordState extends Equatable {
  final String? email;
  final ServiceStatus status;
  final InfoMessage? message;
  final PasswordResetStep step;
  final String? newPassword;
  final String? resetCode;

  const ResetPasswordState({
    this.email,
    this.status = ServiceStatus.initial,
    this.message,
    this.resetCode,
    this.newPassword,
    this.step = PasswordResetStep.one,
  });

  @override
  List<Object?> get props =>
      [email, status, message, step, newPassword, resetCode];

  ResetPasswordState copyWith({
    String? email,
    ServiceStatus? status,
    InfoMessage? message,
    PasswordResetStep? step,
    String? resetCode,
    String? newPassword,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      message: message,
      resetCode: resetCode ?? this.resetCode,
      newPassword: newPassword ?? this.newPassword,
      step: step ?? this.step,
    );
  }
}
