// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      user: User.fromJson(json['user']),
      address:
          Address.fromJson(json['delivery_address'] as Map<String, dynamic>),
      items: (json['order_items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      payment:
          json['payment'] == null ? null : Payment.fromJson(json['payment']),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'user': instance.user,
      'delivery_address': instance.address,
      'order_items': instance.items,
      'payment': instance.payment,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.PENDING: 'PENDING',
  OrderStatus.ACTIVE: 'ACTIVE',
  OrderStatus.CANCELLED: 'CANCELLED',
  OrderStatus.DELIVERED: 'DELIVERED',
};

_$_OrderItem _$$_OrderItemFromJson(Map<String, dynamic> json) => _$_OrderItem(
      product: Product.fromJson(json['product']),
      quantity: (json['quantity'] as num).toDouble(),
      delivered: json['delivered'] as bool,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'delivered': instance.delivered,
      'id': instance.id,
    };
