import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {
  const Password.dirty([value = ""]) : super.dirty(value);
  const Password.pure([value = ""]) : super.pure(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return "Required";
    }
    if (value.length < 6) {
      return "Password too short";
    }
    return null;
  }
}

class PhoneNumber extends FormzInput<String, String> {
  const PhoneNumber.dirty([value = ""]) : super.dirty(value);
  const PhoneNumber.pure([value = ""]) : super.pure(value);

  static final phoneRegex = RegExp(r"^0(7|1)\d{8}$");
  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return "Required";
    }
    if (!phoneRegex.hasMatch(value)) {
      return "Provide valid phone number eg 0742446921";
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

