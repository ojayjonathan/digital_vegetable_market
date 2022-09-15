// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      mode: $enumDecode(_$PaymentModeEnumMap, json['mode']),
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'mode': _$PaymentModeEnumMap[instance.mode]!,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'amount': instance.amount,
    };

const _$PaymentModeEnumMap = {
  PaymentMode.ONLINE: 'ONLINE',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.PENDING: 'PENDING',
  PaymentStatus.COMPLETED: 'COMPLETED',
  PaymentStatus.CANCELLED: 'CANCELLED',
  PaymentStatus.REVERSED: 'REVERSED',
};
