part of 'bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.password = const Password.pure(),
    this.phone = const PhoneNumber.pure(),
    this.status = FormzStatus.pure,
    this.rememberMe = true,
    this.message,
  });

  final Password password;
  final PhoneNumber phone;
  final FormzStatus status;
  final bool rememberMe;
  final InfoMessage? message;

  @override
  List<Object?> get props => [
        password,
        phone,
        status,
        rememberMe,
      ];
  LoginState copyWith({
    Password? password,
    PhoneNumber? phone,
    FormzStatus? status,
    bool? rememberMe,
    InfoMessage? message,
  }) {
    return LoginState(
      rememberMe: rememberMe ?? this.rememberMe,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      message: message,
    );
  }
}
