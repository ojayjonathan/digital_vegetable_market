// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  @JsonKey(name: "expected_available_date")
  DateTime get availableDate => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: "measurement_unit")
  String get measurementUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "image_url") String image,
      String? description,
      User owner,
      String name,
      Address address,
      @JsonKey(name: "expected_available_date") DateTime availableDate,
      double price,
      @JsonKey(name: "measurement_unit") String measurementUnit});

  $UserCopyWith<$Res> get owner;
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? owner = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? availableDate = freezed,
    Object? price = freezed,
    Object? measurementUnit = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      availableDate: availableDate == freezed
          ? _value.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      measurementUnit: measurementUnit == freezed
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }

  @override
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "image_url") String image,
      String? description,
      User owner,
      String name,
      Address address,
      @JsonKey(name: "expected_available_date") DateTime availableDate,
      double price,
      @JsonKey(name: "measurement_unit") String measurementUnit});

  @override
  $UserCopyWith<$Res> get owner;
  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, (v) => _then(v as _$_Product));

  @override
  _$_Product get _value => super._value as _$_Product;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? owner = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? availableDate = freezed,
    Object? price = freezed,
    Object? measurementUnit = freezed,
  }) {
    return _then(_$_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      availableDate: availableDate == freezed
          ? _value.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      measurementUnit: measurementUnit == freezed
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product extends _Product {
  _$_Product(
      {required this.id,
      @JsonKey(name: "image_url") required this.image,
      this.description,
      required this.owner,
      required this.name,
      required this.address,
      @JsonKey(name: "expected_available_date") required this.availableDate,
      required this.price,
      @JsonKey(name: "measurement_unit") required this.measurementUnit})
      : super._();

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "image_url")
  final String image;
  @override
  final String? description;
  @override
  final User owner;
  @override
  final String name;
  @override
  final Address address;
  @override
  @JsonKey(name: "expected_available_date")
  final DateTime availableDate;
  @override
  final double price;
  @override
  @JsonKey(name: "measurement_unit")
  final String measurementUnit;

  @override
  String toString() {
    return 'Product(id: $id, image: $image, description: $description, owner: $owner, name: $name, address: $address, availableDate: $availableDate, price: $price, measurementUnit: $measurementUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.availableDate, availableDate) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.measurementUnit, measurementUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(availableDate),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(measurementUnit));

  @JsonKey(ignore: true)
  @override
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  factory _Product(
      {required final int id,
      @JsonKey(name: "image_url")
          required final String image,
      final String? description,
      required final User owner,
      required final String name,
      required final Address address,
      @JsonKey(name: "expected_available_date")
          required final DateTime availableDate,
      required final double price,
      @JsonKey(name: "measurement_unit")
          required final String measurementUnit}) = _$_Product;
  _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "image_url")
  String get image;
  @override
  String? get description;
  @override
  User get owner;
  @override
  String get name;
  @override
  Address get address;
  @override
  @JsonKey(name: "expected_available_date")
  DateTime get availableDate;
  @override
  double get price;
  @override
  @JsonKey(name: "measurement_unit")
  String get measurementUnit;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductsPage _$ProductsPageFromJson(Map<String, dynamic> json) {
  return _ProductsPage.fromJson(json);
}

/// @nodoc
mixin _$ProductsPage {
  int get pages => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  @JsonKey(name: "current_page")
  int get currentPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsPageCopyWith<ProductsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsPageCopyWith<$Res> {
  factory $ProductsPageCopyWith(
          ProductsPage value, $Res Function(ProductsPage) then) =
      _$ProductsPageCopyWithImpl<$Res>;
  $Res call(
      {int pages,
      List<Product> products,
      @JsonKey(name: "current_page") int currentPage});
}

/// @nodoc
class _$ProductsPageCopyWithImpl<$Res> implements $ProductsPageCopyWith<$Res> {
  _$ProductsPageCopyWithImpl(this._value, this._then);

  final ProductsPage _value;
  // ignore: unused_field
  final $Res Function(ProductsPage) _then;

  @override
  $Res call({
    Object? pages = freezed,
    Object? products = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_value.copyWith(
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductsPageCopyWith<$Res>
    implements $ProductsPageCopyWith<$Res> {
  factory _$$_ProductsPageCopyWith(
          _$_ProductsPage value, $Res Function(_$_ProductsPage) then) =
      __$$_ProductsPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {int pages,
      List<Product> products,
      @JsonKey(name: "current_page") int currentPage});
}

/// @nodoc
class __$$_ProductsPageCopyWithImpl<$Res>
    extends _$ProductsPageCopyWithImpl<$Res>
    implements _$$_ProductsPageCopyWith<$Res> {
  __$$_ProductsPageCopyWithImpl(
      _$_ProductsPage _value, $Res Function(_$_ProductsPage) _then)
      : super(_value, (v) => _then(v as _$_ProductsPage));

  @override
  _$_ProductsPage get _value => super._value as _$_ProductsPage;

  @override
  $Res call({
    Object? pages = freezed,
    Object? products = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_$_ProductsPage(
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductsPage implements _ProductsPage {
  _$_ProductsPage(
      {required this.pages,
      required final List<Product> products,
      @JsonKey(name: "current_page") required this.currentPage})
      : _products = products;

  factory _$_ProductsPage.fromJson(Map<String, dynamic> json) =>
      _$$_ProductsPageFromJson(json);

  @override
  final int pages;
  final List<Product> _products;
  @override
  List<Product> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey(name: "current_page")
  final int currentPage;

  @override
  String toString() {
    return 'ProductsPage(pages: $pages, products: $products, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsPage &&
            const DeepCollectionEquality().equals(other.pages, pages) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pages),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(currentPage));

  @JsonKey(ignore: true)
  @override
  _$$_ProductsPageCopyWith<_$_ProductsPage> get copyWith =>
      __$$_ProductsPageCopyWithImpl<_$_ProductsPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsPageToJson(
      this,
    );
  }
}

abstract class _ProductsPage implements ProductsPage {
  factory _ProductsPage(
          {required final int pages,
          required final List<Product> products,
          @JsonKey(name: "current_page") required final int currentPage}) =
      _$_ProductsPage;

  factory _ProductsPage.fromJson(Map<String, dynamic> json) =
      _$_ProductsPage.fromJson;

  @override
  int get pages;
  @override
  List<Product> get products;
  @override
  @JsonKey(name: "current_page")
  int get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsPageCopyWith<_$_ProductsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductCreate {
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_id")
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: "expected_available_date")
  DateTime get availableDate => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address_id")
  int get addressId => throw _privateConstructorUsedError;
  @JsonKey(name: "available_quantity")
  double get availableQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: "measurement_unit")
  String get measurementUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCreateCopyWith<ProductCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCreateCopyWith<$Res> {
  factory $ProductCreateCopyWith(
          ProductCreate value, $Res Function(ProductCreate) then) =
      _$ProductCreateCopyWithImpl<$Res>;
  $Res call(
      {String description,
      @JsonKey(name: "owner_id") String ownerId,
      @JsonKey(name: "expected_available_date") DateTime availableDate,
      double price,
      String name,
      @JsonKey(name: "address_id") int addressId,
      @JsonKey(name: "available_quantity") double availableQuantity,
      @JsonKey(name: "measurement_unit") String measurementUnit});
}

/// @nodoc
class _$ProductCreateCopyWithImpl<$Res>
    implements $ProductCreateCopyWith<$Res> {
  _$ProductCreateCopyWithImpl(this._value, this._then);

  final ProductCreate _value;
  // ignore: unused_field
  final $Res Function(ProductCreate) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? ownerId = freezed,
    Object? availableDate = freezed,
    Object? price = freezed,
    Object? name = freezed,
    Object? addressId = freezed,
    Object? availableQuantity = freezed,
    Object? measurementUnit = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      availableDate: availableDate == freezed
          ? _value.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: availableQuantity == freezed
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      measurementUnit: measurementUnit == freezed
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductCreateCopyWith<$Res>
    implements $ProductCreateCopyWith<$Res> {
  factory _$$_ProductCreateCopyWith(
          _$_ProductCreate value, $Res Function(_$_ProductCreate) then) =
      __$$_ProductCreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      @JsonKey(name: "owner_id") String ownerId,
      @JsonKey(name: "expected_available_date") DateTime availableDate,
      double price,
      String name,
      @JsonKey(name: "address_id") int addressId,
      @JsonKey(name: "available_quantity") double availableQuantity,
      @JsonKey(name: "measurement_unit") String measurementUnit});
}

/// @nodoc
class __$$_ProductCreateCopyWithImpl<$Res>
    extends _$ProductCreateCopyWithImpl<$Res>
    implements _$$_ProductCreateCopyWith<$Res> {
  __$$_ProductCreateCopyWithImpl(
      _$_ProductCreate _value, $Res Function(_$_ProductCreate) _then)
      : super(_value, (v) => _then(v as _$_ProductCreate));

  @override
  _$_ProductCreate get _value => super._value as _$_ProductCreate;

  @override
  $Res call({
    Object? description = freezed,
    Object? ownerId = freezed,
    Object? availableDate = freezed,
    Object? price = freezed,
    Object? name = freezed,
    Object? addressId = freezed,
    Object? availableQuantity = freezed,
    Object? measurementUnit = freezed,
  }) {
    return _then(_$_ProductCreate(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      availableDate: availableDate == freezed
          ? _value.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: availableQuantity == freezed
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      measurementUnit: measurementUnit == freezed
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$_ProductCreate implements _ProductCreate {
  _$_ProductCreate(
      {this.description = "",
      @JsonKey(name: "owner_id") required this.ownerId,
      @JsonKey(name: "expected_available_date") required this.availableDate,
      required this.price,
      required this.name,
      @JsonKey(name: "address_id") required this.addressId,
      @JsonKey(name: "available_quantity") required this.availableQuantity,
      @JsonKey(name: "measurement_unit") required this.measurementUnit});

  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: "owner_id")
  final String ownerId;
  @override
  @JsonKey(name: "expected_available_date")
  final DateTime availableDate;
  @override
  final double price;
  @override
  final String name;
  @override
  @JsonKey(name: "address_id")
  final int addressId;
  @override
  @JsonKey(name: "available_quantity")
  final double availableQuantity;
  @override
  @JsonKey(name: "measurement_unit")
  final String measurementUnit;

  @override
  String toString() {
    return 'ProductCreate(description: $description, ownerId: $ownerId, availableDate: $availableDate, price: $price, name: $name, addressId: $addressId, availableQuantity: $availableQuantity, measurementUnit: $measurementUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductCreate &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.ownerId, ownerId) &&
            const DeepCollectionEquality()
                .equals(other.availableDate, availableDate) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.addressId, addressId) &&
            const DeepCollectionEquality()
                .equals(other.availableQuantity, availableQuantity) &&
            const DeepCollectionEquality()
                .equals(other.measurementUnit, measurementUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(ownerId),
      const DeepCollectionEquality().hash(availableDate),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(addressId),
      const DeepCollectionEquality().hash(availableQuantity),
      const DeepCollectionEquality().hash(measurementUnit));

  @JsonKey(ignore: true)
  @override
  _$$_ProductCreateCopyWith<_$_ProductCreate> get copyWith =>
      __$$_ProductCreateCopyWithImpl<_$_ProductCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductCreateToJson(
      this,
    );
  }
}

abstract class _ProductCreate implements ProductCreate {
  factory _ProductCreate(
      {final String description,
      @JsonKey(name: "owner_id")
          required final String ownerId,
      @JsonKey(name: "expected_available_date")
          required final DateTime availableDate,
      required final double price,
      required final String name,
      @JsonKey(name: "address_id")
          required final int addressId,
      @JsonKey(name: "available_quantity")
          required final double availableQuantity,
      @JsonKey(name: "measurement_unit")
          required final String measurementUnit}) = _$_ProductCreate;

  @override
  String get description;
  @override
  @JsonKey(name: "owner_id")
  String get ownerId;
  @override
  @JsonKey(name: "expected_available_date")
  DateTime get availableDate;
  @override
  double get price;
  @override
  String get name;
  @override
  @JsonKey(name: "address_id")
  int get addressId;
  @override
  @JsonKey(name: "available_quantity")
  double get availableQuantity;
  @override
  @JsonKey(name: "measurement_unit")
  String get measurementUnit;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCreateCopyWith<_$_ProductCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductUpdate {
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "expected_available_date")
  DateTime? get availableDate => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "available_quantity")
  double? get availableQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: "measurement_unit")
  String? get measurementUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductUpdateCopyWith<ProductUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductUpdateCopyWith<$Res> {
  factory $ProductUpdateCopyWith(
          ProductUpdate value, $Res Function(ProductUpdate) then) =
      _$ProductUpdateCopyWithImpl<$Res>;
  $Res call(
      {String? description,
      @JsonKey(name: "expected_available_date") DateTime? availableDate,
      double? price,
      String? name,
      @JsonKey(name: "available_quantity") double? availableQuantity,
      @JsonKey(name: "measurement_unit") String? measurementUnit});
}

/// @nodoc
class _$ProductUpdateCopyWithImpl<$Res>
    implements $ProductUpdateCopyWith<$Res> {
  _$ProductUpdateCopyWithImpl(this._value, this._then);

  final ProductUpdate _value;
  // ignore: unused_field
  final $Res Function(ProductUpdate) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? availableDate = freezed,
    Object? price = freezed,
    Object? name = freezed,
    Object? availableQuantity = freezed,
    Object? measurementUnit = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      availableDate: availableDate == freezed
          ? _value.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      availableQuantity: availableQuantity == freezed
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      measurementUnit: measurementUnit == freezed
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductUpdateCopyWith<$Res>
    implements $ProductUpdateCopyWith<$Res> {
  factory _$$_ProductUpdateCopyWith(
          _$_ProductUpdate value, $Res Function(_$_ProductUpdate) then) =
      __$$_ProductUpdateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? description,
      @JsonKey(name: "expected_available_date") DateTime? availableDate,
      double? price,
      String? name,
      @JsonKey(name: "available_quantity") double? availableQuantity,
      @JsonKey(name: "measurement_unit") String? measurementUnit});
}

/// @nodoc
class __$$_ProductUpdateCopyWithImpl<$Res>
    extends _$ProductUpdateCopyWithImpl<$Res>
    implements _$$_ProductUpdateCopyWith<$Res> {
  __$$_ProductUpdateCopyWithImpl(
      _$_ProductUpdate _value, $Res Function(_$_ProductUpdate) _then)
      : super(_value, (v) => _then(v as _$_ProductUpdate));

  @override
  _$_ProductUpdate get _value => super._value as _$_ProductUpdate;

  @override
  $Res call({
    Object? description = freezed,
    Object? availableDate = freezed,
    Object? price = freezed,
    Object? name = freezed,
    Object? availableQuantity = freezed,
    Object? measurementUnit = freezed,
  }) {
    return _then(_$_ProductUpdate(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      availableDate: availableDate == freezed
          ? _value.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      availableQuantity: availableQuantity == freezed
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      measurementUnit: measurementUnit == freezed
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$_ProductUpdate implements _ProductUpdate {
  _$_ProductUpdate(
      {this.description,
      @JsonKey(name: "expected_available_date") this.availableDate,
      this.price,
      this.name,
      @JsonKey(name: "available_quantity") this.availableQuantity,
      @JsonKey(name: "measurement_unit") this.measurementUnit});

  @override
  final String? description;
  @override
  @JsonKey(name: "expected_available_date")
  final DateTime? availableDate;
  @override
  final double? price;
  @override
  final String? name;
  @override
  @JsonKey(name: "available_quantity")
  final double? availableQuantity;
  @override
  @JsonKey(name: "measurement_unit")
  final String? measurementUnit;

  @override
  String toString() {
    return 'ProductUpdate(description: $description, availableDate: $availableDate, price: $price, name: $name, availableQuantity: $availableQuantity, measurementUnit: $measurementUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductUpdate &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.availableDate, availableDate) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.availableQuantity, availableQuantity) &&
            const DeepCollectionEquality()
                .equals(other.measurementUnit, measurementUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(availableDate),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(availableQuantity),
      const DeepCollectionEquality().hash(measurementUnit));

  @JsonKey(ignore: true)
  @override
  _$$_ProductUpdateCopyWith<_$_ProductUpdate> get copyWith =>
      __$$_ProductUpdateCopyWithImpl<_$_ProductUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductUpdateToJson(
      this,
    );
  }
}

abstract class _ProductUpdate implements ProductUpdate {
  factory _ProductUpdate(
      {final String? description,
      @JsonKey(name: "expected_available_date")
          final DateTime? availableDate,
      final double? price,
      final String? name,
      @JsonKey(name: "available_quantity")
          final double? availableQuantity,
      @JsonKey(name: "measurement_unit")
          final String? measurementUnit}) = _$_ProductUpdate;

  @override
  String? get description;
  @override
  @JsonKey(name: "expected_available_date")
  DateTime? get availableDate;
  @override
  double? get price;
  @override
  String? get name;
  @override
  @JsonKey(name: "available_quantity")
  double? get availableQuantity;
  @override
  @JsonKey(name: "measurement_unit")
  String? get measurementUnit;
  @override
  @JsonKey(ignore: true)
  _$$_ProductUpdateCopyWith<_$_ProductUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
