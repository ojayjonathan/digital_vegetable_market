// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.g.dart';
part 'payment.freezed.dart';

enum PaymentMode { ONLINE }

enum PaymentStatus { PENDING, COMPLETED, CANCELLED, REVERSED }

@freezed
class Payment with _$Payment {
  factory Payment({
    required int id,
    @JsonKey(name: "created_at") required DateTime createdAt,
    required PaymentMode mode,
    required PaymentStatus status,
    required double amount,
  }) = _Payment;
  factory Payment.fromJson(json) => _$$_PaymentFromJson(json);

}
