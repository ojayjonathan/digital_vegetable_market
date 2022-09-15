// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageResponse _$$_MessageResponseFromJson(Map<String, dynamic> json) =>
    _$_MessageResponse(
      message: json['message'] as String,
      details: json['details'] as Map<String, dynamic>? ?? {},
    );

Map<String, dynamic> _$$_MessageResponseToJson(_$_MessageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'details': instance.details,
    };
