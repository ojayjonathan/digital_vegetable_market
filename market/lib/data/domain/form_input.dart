import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {
  const Password.dirty([value = ""]) : super.dirty(value);
  const Password.pure([value = ""]) : super.pure(value);

  @override
  String? validator(String value) => valueValidator(value);
  static String? valueValidator(String? value) {
    if (value == null) return "Required";
    if (value.isEmpty) {
      return "Required";
    }
    if (value.length < 4) {
      return "Password too short";
    }
    return null;
  }
}

class PhoneNumber extends FormzInput<String, String> {
  const PhoneNumber.dirty([value = ""]) : super.dirty(value);
  const PhoneNumber.pure([value = ""]) : super.pure(value);

  static final phoneRegex = RegExp(r"^\+\d{12}$");
  @override
  String? validator(String value) => validator(value);

  static String? valueValidator(String? value) {
    if (value == null) return "Required";
    if (value.isEmpty) {
      return "Required";
    }
    if (!phoneRegex.hasMatch(value)) {
      return "Provide valid phone number eg +254742446921";
    }
    return null;
  }
}

class Email extends FormzInput<String, String> {
  const Email.dirty([value = ""]) : super.dirty(value);
  const Email.pure([value = ""]) : super.pure(value);
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  String? validator(String value) => valueValidator(value);

  static String? valueValidator(String? value) {
    if (value == null) return "Required";
    if (value.isEmpty) {
      return "Required";
    }
    if (!emailRegex.hasMatch(value)) {
      return "Provide valid email eg user@gmail.com";
    }
    return null;
  }
}

class TextInput extends FormzInput<String, String> {
  const TextInput.dirty([value = ""]) : super.dirty(value);
  const TextInput.pure([value = ""]) : super.pure(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return "Required";
    }

    return null;
  }
}

String? requiredValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Required";
  }

  return null;
}
