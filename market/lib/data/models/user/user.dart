import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required int id,
    String? image,
    @JsonKey(defaultValue: "") required String email,
    @JsonKey(name: "phone_number") required String phoneNumber,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "is_farmer", defaultValue: false) required bool isFarmer,
  }) = _User;
  factory User.fromJson(json) => _$$_UserFromJson(json);
}

@Freezed(toJson: true)
class UserCreate with _$UserCreate {
  factory UserCreate({
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone_number") required String phoneNumber,
    required String password,
    String? email,
    @JsonKey(name: "is_farmer", defaultValue: false) required bool isFarmer,
  }) = _UserCreate;
}

@freezed
class Wallet with _$Wallet {
  factory Wallet({
    required int id,
    required double balance,
  }) = _Wallet;
  factory Wallet.fromJson(json) => _$$_WalletFromJson(json);
}
