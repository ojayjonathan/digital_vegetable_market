import 'package:equatable/equatable.dart';
import 'package:market/data/error/error_format.dart';

class ErrorObject extends Equatable {
  final String message;
  final Map extra;
  final int? statusCode;
  const ErrorObject(
    this.message, {
    this.extra = const {},
    this.statusCode,
  });

  factory ErrorObject.fromException(exception) => getException(exception);
  @override
  List<Object?> get props => [statusCode, message, extra];
  @override
  String toString() {
    return message;
  }
}

class FieldError extends Equatable {
  final String field;
  final String message;
  const FieldError(this.field, this.message);
  factory FieldError.fromJson(json) {
    return FieldError(json["field"], json["message"]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [field, message];
}

extension X on ErrorObject {
  Map<String, String> get fieldErrors {
    Map<String, String> values = {};
    if (extra["fieldErrors"] != null) {
      for (final item in extra["fieldErrors"] ?? []) {
        final FieldError error = FieldError.fromJson(item);
        values[error.field] = error.message;
      }
    }
    return values;
  }
}
