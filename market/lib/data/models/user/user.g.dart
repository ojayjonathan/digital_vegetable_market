// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      id: json['id'] as int,
      image: json['image'] as String?,
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone_number'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isFarmer: json['is_farmer'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'id': instance.id,
      'image': instance.image,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt.toIso8601String(),
      'is_farmer': instance.isFarmer,
    };

Map<String, dynamic> _$$_UserCreateToJson(_$_UserCreate instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'email': instance.email,
      'is_farmer': instance.isFarmer,
    };

_$_Wallet _$$_WalletFromJson(Map<String, dynamic> json) => _$_Wallet(
      id: json['id'] as int,
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WalletToJson(_$_Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
    };
