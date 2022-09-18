// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.PENDING,
      user: json['user'] == null ? null : User.fromJson(json['user']),
      address:
          Address.fromJson(json['delivery_address'] as Map<String, dynamic>),
      items: (json['order_items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      payment:
          json['payment'] == null ? null : Payment.fromJson(json['payment']),
      shippingCost: (json['shipping_cost'] as num?)?.toDouble() ?? 0,
      detail: (json['detail'] as List<dynamic>)
          .map((e) => OrderDetail.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'user': instance.user,
      'delivery_address': instance.address,
      'order_items': instance.items,
      'payment': instance.payment,
      'shipping_cost': instance.shippingCost,
      'detail': instance.detail,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.PENDING: 'PENDING',
  OrderStatus.ACTIVE: 'ACTIVE',
  OrderStatus.CANCELLED: 'CANCELLED',
  OrderStatus.DELIVERED: 'DELIVERED',
  OrderStatus.INITIAL: 'INITIAL',
};

_$_OrderItem _$$_OrderItemFromJson(Map<String, dynamic> json) => _$_OrderItem(
      product: Product.fromJson(json['product']),
      quantity: (json['quantity'] as num).toDouble(),
      delivered: json['delivered'] as bool? ?? false,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'delivered': instance.delivered,
      'id': instance.id,
    };

_$_OrderDetail _$$_OrderDetailFromJson(Map<String, dynamic> json) =>
    _$_OrderDetail(
      orderItemId: json['order_item_id'] as int?,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_OrderDetailToJson(_$_OrderDetail instance) =>
    <String, dynamic>{
      'order_item_id': instance.orderItemId,
      'message': instance.message,
      'created_at': instance.createdAt.toIso8601String(),
    };
