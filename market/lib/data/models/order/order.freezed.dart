// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: OrderStatus.PENDING)
  OrderStatus get status => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery_address")
  Address get address => throw _privateConstructorUsedError;
  @JsonKey(name: "order_items")
  List<OrderItem> get items => throw _privateConstructorUsedError;
  Payment? get payment => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_cost", defaultValue: 0)
  double get shippingCost => throw _privateConstructorUsedError;
  List<OrderDetail> get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "created_at") DateTime createdAt,
      int? id,
      @JsonKey(defaultValue: OrderStatus.PENDING) OrderStatus status,
      User? user,
      @JsonKey(name: "delivery_address") Address address,
      @JsonKey(name: "order_items") List<OrderItem> items,
      Payment? payment,
      @JsonKey(name: "shipping_cost", defaultValue: 0) double shippingCost,
      List<OrderDetail> detail});

  $UserCopyWith<$Res>? get user;
  $AddressCopyWith<$Res> get address;
  $PaymentCopyWith<$Res>? get payment;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? address = freezed,
    Object? items = freezed,
    Object? payment = freezed,
    Object? shippingCost = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment?,
      shippingCost: shippingCost == freezed
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<OrderDetail>,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }

  @override
  $PaymentCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "created_at") DateTime createdAt,
      int? id,
      @JsonKey(defaultValue: OrderStatus.PENDING) OrderStatus status,
      User? user,
      @JsonKey(name: "delivery_address") Address address,
      @JsonKey(name: "order_items") List<OrderItem> items,
      Payment? payment,
      @JsonKey(name: "shipping_cost", defaultValue: 0) double shippingCost,
      List<OrderDetail> detail});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $AddressCopyWith<$Res> get address;
  @override
  $PaymentCopyWith<$Res>? get payment;
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, (v) => _then(v as _$_Order));

  @override
  _$_Order get _value => super._value as _$_Order;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? address = freezed,
    Object? items = freezed,
    Object? payment = freezed,
    Object? shippingCost = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$_Order(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment?,
      shippingCost: shippingCost == freezed
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      detail: detail == freezed
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<OrderDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order extends _Order {
  _$_Order(
      {@JsonKey(name: "created_at")
          required this.createdAt,
      this.id,
      @JsonKey(defaultValue: OrderStatus.PENDING)
          required this.status,
      this.user,
      @JsonKey(name: "delivery_address")
          required this.address,
      @JsonKey(name: "order_items")
          required final List<OrderItem> items,
      this.payment,
      @JsonKey(name: "shipping_cost", defaultValue: 0)
          required this.shippingCost,
      required final List<OrderDetail> detail})
      : _items = items,
        _detail = detail,
        super._();

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  final int? id;
  @override
  @JsonKey(defaultValue: OrderStatus.PENDING)
  final OrderStatus status;
  @override
  final User? user;
  @override
  @JsonKey(name: "delivery_address")
  final Address address;
  final List<OrderItem> _items;
  @override
  @JsonKey(name: "order_items")
  List<OrderItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Payment? payment;
  @override
  @JsonKey(name: "shipping_cost", defaultValue: 0)
  final double shippingCost;
  final List<OrderDetail> _detail;
  @override
  List<OrderDetail> get detail {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detail);
  }

  @override
  String toString() {
    return 'Order(createdAt: $createdAt, id: $id, status: $status, user: $user, address: $address, items: $items, payment: $payment, shippingCost: $shippingCost, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.payment, payment) &&
            const DeepCollectionEquality()
                .equals(other.shippingCost, shippingCost) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(payment),
      const DeepCollectionEquality().hash(shippingCost),
      const DeepCollectionEquality().hash(_detail));

  @JsonKey(ignore: true)
  @override
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  factory _Order(
      {@JsonKey(name: "created_at")
          required final DateTime createdAt,
      final int? id,
      @JsonKey(defaultValue: OrderStatus.PENDING)
          required final OrderStatus status,
      final User? user,
      @JsonKey(name: "delivery_address")
          required final Address address,
      @JsonKey(name: "order_items")
          required final List<OrderItem> items,
      final Payment? payment,
      @JsonKey(name: "shipping_cost", defaultValue: 0)
          required final double shippingCost,
      required final List<OrderDetail> detail}) = _$_Order;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  int? get id;
  @override
  @JsonKey(defaultValue: OrderStatus.PENDING)
  OrderStatus get status;
  @override
  User? get user;
  @override
  @JsonKey(name: "delivery_address")
  Address get address;
  @override
  @JsonKey(name: "order_items")
  List<OrderItem> get items;
  @override
  Payment? get payment;
  @override
  @JsonKey(name: "shipping_cost", defaultValue: 0)
  double get shippingCost;
  @override
  List<OrderDetail> get detail;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  Product get product => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get delivered => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res>;
  $Res call(
      {Product product,
      double quantity,
      @JsonKey(defaultValue: false) bool delivered,
      int? id});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res> implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  final OrderItem _value;
  // ignore: unused_field
  final $Res Function(OrderItem) _then;

  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
    Object? delivered = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      delivered: delivered == freezed
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$$_OrderItemCopyWith(
          _$_OrderItem value, $Res Function(_$_OrderItem) then) =
      __$$_OrderItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {Product product,
      double quantity,
      @JsonKey(defaultValue: false) bool delivered,
      int? id});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_OrderItemCopyWithImpl<$Res> extends _$OrderItemCopyWithImpl<$Res>
    implements _$$_OrderItemCopyWith<$Res> {
  __$$_OrderItemCopyWithImpl(
      _$_OrderItem _value, $Res Function(_$_OrderItem) _then)
      : super(_value, (v) => _then(v as _$_OrderItem));

  @override
  _$_OrderItem get _value => super._value as _$_OrderItem;

  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
    Object? delivered = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_OrderItem(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      delivered: delivered == freezed
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderItem implements _OrderItem {
  _$_OrderItem(
      {required this.product,
      required this.quantity,
      @JsonKey(defaultValue: false) required this.delivered,
      this.id});

  factory _$_OrderItem.fromJson(Map<String, dynamic> json) =>
      _$$_OrderItemFromJson(json);

  @override
  final Product product;
  @override
  final double quantity;
  @override
  @JsonKey(defaultValue: false)
  final bool delivered;
  @override
  final int? id;

  @override
  String toString() {
    return 'OrderItem(product: $product, quantity: $quantity, delivered: $delivered, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItem &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.delivered, delivered) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(delivered),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      __$$_OrderItemCopyWithImpl<_$_OrderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderItemToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  factory _OrderItem(
      {required final Product product,
      required final double quantity,
      @JsonKey(defaultValue: false) required final bool delivered,
      final int? id}) = _$_OrderItem;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$_OrderItem.fromJson;

  @override
  Product get product;
  @override
  double get quantity;
  @override
  @JsonKey(defaultValue: false)
  bool get delivered;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderItemCreate {
  int get productId => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderItemCreateCopyWith<OrderItemCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCreateCopyWith<$Res> {
  factory $OrderItemCreateCopyWith(
          OrderItemCreate value, $Res Function(OrderItemCreate) then) =
      _$OrderItemCreateCopyWithImpl<$Res>;
  $Res call({int productId, double quantity});
}

/// @nodoc
class _$OrderItemCreateCopyWithImpl<$Res>
    implements $OrderItemCreateCopyWith<$Res> {
  _$OrderItemCreateCopyWithImpl(this._value, this._then);

  final OrderItemCreate _value;
  // ignore: unused_field
  final $Res Function(OrderItemCreate) _then;

  @override
  $Res call({
    Object? productId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderItemCreateCopyWith<$Res>
    implements $OrderItemCreateCopyWith<$Res> {
  factory _$$_OrderItemCreateCopyWith(
          _$_OrderItemCreate value, $Res Function(_$_OrderItemCreate) then) =
      __$$_OrderItemCreateCopyWithImpl<$Res>;
  @override
  $Res call({int productId, double quantity});
}

/// @nodoc
class __$$_OrderItemCreateCopyWithImpl<$Res>
    extends _$OrderItemCreateCopyWithImpl<$Res>
    implements _$$_OrderItemCreateCopyWith<$Res> {
  __$$_OrderItemCreateCopyWithImpl(
      _$_OrderItemCreate _value, $Res Function(_$_OrderItemCreate) _then)
      : super(_value, (v) => _then(v as _$_OrderItemCreate));

  @override
  _$_OrderItemCreate get _value => super._value as _$_OrderItemCreate;

  @override
  $Res call({
    Object? productId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_OrderItemCreate(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_OrderItemCreate extends _OrderItemCreate {
  _$_OrderItemCreate({required this.productId, required this.quantity})
      : super._();

  @override
  final int productId;
  @override
  final double quantity;

  @override
  String toString() {
    return 'OrderItemCreate(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItemCreate &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_OrderItemCreateCopyWith<_$_OrderItemCreate> get copyWith =>
      __$$_OrderItemCreateCopyWithImpl<_$_OrderItemCreate>(this, _$identity);
}

abstract class _OrderItemCreate extends OrderItemCreate {
  factory _OrderItemCreate(
      {required final int productId,
      required final double quantity}) = _$_OrderItemCreate;
  _OrderItemCreate._() : super._();

  @override
  int get productId;
  @override
  double get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_OrderItemCreateCopyWith<_$_OrderItemCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return _OrderDetail.fromJson(json);
}

/// @nodoc
mixin _$OrderDetail {
  @JsonKey(name: "order_item_id")
  int? get orderItemId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) then) =
      _$OrderDetailCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "order_item_id") int? orderItemId,
      String message,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$OrderDetailCopyWithImpl<$Res> implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._value, this._then);

  final OrderDetail _value;
  // ignore: unused_field
  final $Res Function(OrderDetail) _then;

  @override
  $Res call({
    Object? orderItemId = freezed,
    Object? message = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      orderItemId: orderItemId == freezed
          ? _value.orderItemId
          : orderItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderDetailCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$$_OrderDetailCopyWith(
          _$_OrderDetail value, $Res Function(_$_OrderDetail) then) =
      __$$_OrderDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "order_item_id") int? orderItemId,
      String message,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_OrderDetailCopyWithImpl<$Res> extends _$OrderDetailCopyWithImpl<$Res>
    implements _$$_OrderDetailCopyWith<$Res> {
  __$$_OrderDetailCopyWithImpl(
      _$_OrderDetail _value, $Res Function(_$_OrderDetail) _then)
      : super(_value, (v) => _then(v as _$_OrderDetail));

  @override
  _$_OrderDetail get _value => super._value as _$_OrderDetail;

  @override
  $Res call({
    Object? orderItemId = freezed,
    Object? message = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_OrderDetail(
      orderItemId: orderItemId == freezed
          ? _value.orderItemId
          : orderItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetail implements _OrderDetail {
  _$_OrderDetail(
      {@JsonKey(name: "order_item_id") this.orderItemId,
      required this.message,
      @JsonKey(name: "created_at") required this.createdAt});

  factory _$_OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailFromJson(json);

  @override
  @JsonKey(name: "order_item_id")
  final int? orderItemId;
  @override
  final String message;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'OrderDetail(orderItemId: $orderItemId, message: $message, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetail &&
            const DeepCollectionEquality()
                .equals(other.orderItemId, orderItemId) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderItemId),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailCopyWith<_$_OrderDetail> get copyWith =>
      __$$_OrderDetailCopyWithImpl<_$_OrderDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailToJson(
      this,
    );
  }
}

abstract class _OrderDetail implements OrderDetail {
  factory _OrderDetail(
          {@JsonKey(name: "order_item_id") final int? orderItemId,
          required final String message,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$_OrderDetail;

  factory _OrderDetail.fromJson(Map<String, dynamic> json) =
      _$_OrderDetail.fromJson;

  @override
  @JsonKey(name: "order_item_id")
  int? get orderItemId;
  @override
  String get message;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailCopyWith<_$_OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
