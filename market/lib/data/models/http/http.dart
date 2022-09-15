import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/data/error/error_object.dart';
part 'http.freezed.dart';

@freezed
class HttpResult<T> with _$HttpResult<T> {
  const factory HttpResult.onError({
    required ErrorObject error,
  }) = ErrorResponse;
  const factory HttpResult.onSuccess({
    required T data,
  }) = SuccessResponse;
}
