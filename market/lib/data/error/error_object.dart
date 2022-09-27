import 'package:equatable/equatable.dart';
import 'package:market/data/error/error_format.dart';

class ErrorObject extends Equatable {
  final String message;
  final Map detail;
  final int? statusCode;
  const ErrorObject(
    this.message, {
    this.detail = const {},
    this.statusCode,
  });

  factory ErrorObject.fromException(exception) => getException(exception);
  @override
  List<Object?> get props => [statusCode, message, detail];
  @override
  String toString() => message;
}




