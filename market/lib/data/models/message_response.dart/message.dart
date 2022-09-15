import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.g.dart';
part 'message.freezed.dart';

@freezed
class MessageResponse with _$MessageResponse {
  factory MessageResponse({
    required String message,
    @JsonKey(defaultValue: {}) required Map details,
  }) = _MessageResponse;
  factory MessageResponse.fromJson(json) => _$$_MessageResponseFromJson(json);
}
