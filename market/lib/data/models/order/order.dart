// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/payment/payment.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/models/user/user.dart';
part 'order.g.dart';
part 'order.freezed.dart';

enum OrderStatus { PENDING, ACTIVE, CANCELLED, DELIVERED, INITIAL }

@Freezed(fromJson: true, copyWith: true)
class Order with _$Order {
  factory Order({
    @JsonKey(name: "created_at") required DateTime createdAt,
    int? id,
    @JsonKey(defaultValue: OrderStatus.PENDING) required OrderStatus status,
    User? user,
    @JsonKey(name: "delivery_address") required Address address,
    @JsonKey(name: "order_items") required List<OrderItem> items,
    Payment? payment,
    required double cost,
    @JsonKey(name: "shipping_cost", defaultValue: 0)
        required double shippingCost,
  }) = _Order;
  factory Order.fromJson(json) => _$$_OrderFromJson(json);
}

@Freezed(fromJson: true, copyWith: true)
class OrderItem with _$OrderItem {
  factory OrderItem({
    required Product product,
    required double quantity,
    @JsonKey(defaultValue: false) required bool delivered,
    int? id,
  }) = _OrderItem;
  factory OrderItem.fromJson(json) => _$$_OrderItemFromJson(json);
}

@Freezed()
class OrderItemCreate with _$OrderItemCreate {
  OrderItemCreate._();
  factory OrderItemCreate({
    required int productId,
    required double quantity,
  }) = _OrderItemCreate;
  Map toJson() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
