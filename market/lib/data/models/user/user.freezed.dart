// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String get lastName => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_farmer", defaultValue: false)
  bool get isFarmer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      int id,
      String? image,
      @JsonKey(defaultValue: "") String email,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "is_farmer", defaultValue: false) bool isFarmer});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? createdAt = freezed,
    Object? isFarmer = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFarmer: isFarmer == freezed
          ? _value.isFarmer
          : isFarmer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      int id,
      String? image,
      @JsonKey(defaultValue: "") String email,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "is_farmer", defaultValue: false) bool isFarmer});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? createdAt = freezed,
    Object? isFarmer = freezed,
  }) {
    return _then(_$_User(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFarmer: isFarmer == freezed
          ? _value.isFarmer
          : isFarmer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {@JsonKey(name: "first_name") required this.firstName,
      @JsonKey(name: "last_name") required this.lastName,
      required this.id,
      this.image,
      @JsonKey(defaultValue: "") required this.email,
      @JsonKey(name: "phone_number") required this.phoneNumber,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "is_farmer", defaultValue: false) required this.isFarmer});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  final int id;
  @override
  final String? image;
  @override
  @JsonKey(defaultValue: "")
  final String email;
  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "is_farmer", defaultValue: false)
  final bool isFarmer;

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, id: $id, image: $image, email: $email, phoneNumber: $phoneNumber, createdAt: $createdAt, isFarmer: $isFarmer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.isFarmer, isFarmer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isFarmer));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: "first_name")
          required final String firstName,
      @JsonKey(name: "last_name")
          required final String lastName,
      required final int id,
      final String? image,
      @JsonKey(defaultValue: "")
          required final String email,
      @JsonKey(name: "phone_number")
          required final String phoneNumber,
      @JsonKey(name: "created_at")
          required final DateTime createdAt,
      @JsonKey(name: "is_farmer", defaultValue: false)
          required final bool isFarmer}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  @JsonKey(name: "last_name")
  String get lastName;
  @override
  int get id;
  @override
  String? get image;
  @override
  @JsonKey(defaultValue: "")
  String get email;
  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "is_farmer", defaultValue: false)
  bool get isFarmer;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserCreate {
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "is_farmer", defaultValue: false)
  bool get isFarmer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCreateCopyWith<UserCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCreateCopyWith<$Res> {
  factory $UserCreateCopyWith(
          UserCreate value, $Res Function(UserCreate) then) =
      _$UserCreateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "phone_number") String phoneNumber,
      String password,
      String? email,
      @JsonKey(name: "is_farmer", defaultValue: false) bool isFarmer});
}

/// @nodoc
class _$UserCreateCopyWithImpl<$Res> implements $UserCreateCopyWith<$Res> {
  _$UserCreateCopyWithImpl(this._value, this._then);

  final UserCreate _value;
  // ignore: unused_field
  final $Res Function(UserCreate) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? isFarmer = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isFarmer: isFarmer == freezed
          ? _value.isFarmer
          : isFarmer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCreateCopyWith<$Res>
    implements $UserCreateCopyWith<$Res> {
  factory _$$_UserCreateCopyWith(
          _$_UserCreate value, $Res Function(_$_UserCreate) then) =
      __$$_UserCreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "phone_number") String phoneNumber,
      String password,
      String? email,
      @JsonKey(name: "is_farmer", defaultValue: false) bool isFarmer});
}

/// @nodoc
class __$$_UserCreateCopyWithImpl<$Res> extends _$UserCreateCopyWithImpl<$Res>
    implements _$$_UserCreateCopyWith<$Res> {
  __$$_UserCreateCopyWithImpl(
      _$_UserCreate _value, $Res Function(_$_UserCreate) _then)
      : super(_value, (v) => _then(v as _$_UserCreate));

  @override
  _$_UserCreate get _value => super._value as _$_UserCreate;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? isFarmer = freezed,
  }) {
    return _then(_$_UserCreate(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isFarmer: isFarmer == freezed
          ? _value.isFarmer
          : isFarmer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$_UserCreate implements _UserCreate {
  _$_UserCreate(
      {@JsonKey(name: "first_name") required this.firstName,
      @JsonKey(name: "last_name") required this.lastName,
      @JsonKey(name: "phone_number") required this.phoneNumber,
      required this.password,
      this.email,
      @JsonKey(name: "is_farmer", defaultValue: false) required this.isFarmer});

  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @override
  final String password;
  @override
  final String? email;
  @override
  @JsonKey(name: "is_farmer", defaultValue: false)
  final bool isFarmer;

  @override
  String toString() {
    return 'UserCreate(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, password: $password, email: $email, isFarmer: $isFarmer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCreate &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.isFarmer, isFarmer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isFarmer));

  @JsonKey(ignore: true)
  @override
  _$$_UserCreateCopyWith<_$_UserCreate> get copyWith =>
      __$$_UserCreateCopyWithImpl<_$_UserCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCreateToJson(
      this,
    );
  }
}

abstract class _UserCreate implements UserCreate {
  factory _UserCreate(
      {@JsonKey(name: "first_name")
          required final String firstName,
      @JsonKey(name: "last_name")
          required final String lastName,
      @JsonKey(name: "phone_number")
          required final String phoneNumber,
      required final String password,
      final String? email,
      @JsonKey(name: "is_farmer", defaultValue: false)
          required final bool isFarmer}) = _$_UserCreate;

  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  @JsonKey(name: "last_name")
  String get lastName;
  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  String get password;
  @override
  String? get email;
  @override
  @JsonKey(name: "is_farmer", defaultValue: false)
  bool get isFarmer;
  @override
  @JsonKey(ignore: true)
  _$$_UserCreateCopyWith<_$_UserCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  double get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res>;
  $Res call({double balance});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res> implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  final Wallet _value;
  // ignore: unused_field
  final $Res Function(Wallet) _then;

  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$_WalletCopyWith(_$_Wallet value, $Res Function(_$_Wallet) then) =
      __$$_WalletCopyWithImpl<$Res>;
  @override
  $Res call({double balance});
}

/// @nodoc
class __$$_WalletCopyWithImpl<$Res> extends _$WalletCopyWithImpl<$Res>
    implements _$$_WalletCopyWith<$Res> {
  __$$_WalletCopyWithImpl(_$_Wallet _value, $Res Function(_$_Wallet) _then)
      : super(_value, (v) => _then(v as _$_Wallet));

  @override
  _$_Wallet get _value => super._value as _$_Wallet;

  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_$_Wallet(
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wallet implements _Wallet {
  _$_Wallet({required this.balance});

  factory _$_Wallet.fromJson(Map<String, dynamic> json) =>
      _$$_WalletFromJson(json);

  @override
  final double balance;

  @override
  String toString() {
    return 'Wallet(balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wallet &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      __$$_WalletCopyWithImpl<_$_Wallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletToJson(
      this,
    );
  }
}

abstract class _Wallet implements Wallet {
  factory _Wallet({required final double balance}) = _$_Wallet;

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$_Wallet.fromJson;

  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      throw _privateConstructorUsedError;
}
