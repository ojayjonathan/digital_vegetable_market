part of 'bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.password = const Password.pure(),
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
    this.firstName = const NameTextInput.pure(),
    this.lastName = const NameTextInput.pure(),
    this.phone = const PhoneNumber.pure(),
    this.fieldError = const {},
    this.message,
  });
  final Password password;
  final Email email;
  final PhoneNumber phone;

  final NameTextInput firstName;
  final NameTextInput lastName;
  final InfoMessage? message;
  final FormzStatus status;
  final Map<String, String> fieldError;

  @override
  List<Object?> get props => [
        password,
        phone,
        email,
        status,
        firstName,
        lastName,
        message,
        fieldError
      ];
  RegisterState copyWith({
    Password? password,
    Email? email,
    FormzStatus? status,
    NameTextInput? firstName,
    NameTextInput? lastName,
    InfoMessage? message,
    PhoneNumber? phone,
    Map<String, String> fieldError = const {},
  }) {
    return RegisterState(
      password: password ?? this.password,
      email: email ?? this.email,
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fieldError: fieldError,
      message: message,
      phone: phone ?? this.phone,
    );
  }
}
