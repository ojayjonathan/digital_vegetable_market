part of 'bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.password = const Password.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.status = FormzStatus.pure,
  });
  final Password password;
  final PhoneNumber phoneNumber;
  final FormzStatus status;

  @override
  List<Object?> get props => [password, phoneNumber, status];
  LoginState copyWith({
    Password? password,
    PhoneNumber? phoneNumber,
    FormzStatus? status,
  }) {
    return LoginState(
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
    );
  }
}
