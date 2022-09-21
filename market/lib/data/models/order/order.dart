// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/payment/payment.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/models/user/user.dart';
part 'order.g.dart';
part 'order.freezed.dart';

enum OrderStatus { PENDING, ACTIVE, CANCELLED, DELIVERED, INITIAL }

enum OrderDetailEvent {
  CREATED,
  CANCELLED,
  CONFIRMED,
  DELIVERED,
  OTHER,
  PROCESSED
}

extension Str on OrderStatus {
  String toStr() {
    switch (this) {
      case OrderStatus.ACTIVE:
        return "Active";
      case OrderStatus.PENDING:
        return "Pending";
      case OrderStatus.CANCELLED:
        return "Cancelled";
      case OrderStatus.DELIVERED:
        return "Delivered";
      default:
        return "Initial";
    }
  }
}

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
    @JsonKey(name: "shipping_cost", defaultValue: 0)
        required double shippingCost,
    required List<OrderDetail> detail,
  }) = _Order;
  Order._();
  double get cost =>
      items.fold(0, (prev, item) => prev + item.quantity * item.product.price);

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

@Freezed(fromJson: true, copyWith: true)
class OrderDetail with _$OrderDetail {
  factory OrderDetail({
    @JsonKey(name: "order_item_id") int? orderItemId,
    required String message,
    @JsonKey(name: "created_at") required DateTime createdAt,
    required OrderDetailEvent event,
  }) = _OrderDetail;
  factory OrderDetail.fromJson(json) => _$$_OrderDetailFromJson(json);
}

extension Ex on OrderDetail {
  String get icon {
    switch (event) {
      case OrderDetailEvent.CONFIRMED:
        return "assets/confirmed.png";
      case OrderDetailEvent.CREATED:
        return "assets/placed.png";
      case OrderDetailEvent.CANCELLED:
        return "assets/cancel.png";
      case OrderDetailEvent.PROCESSED:
        return "assets/processes.png";
      case OrderDetailEvent.DELIVERED:
        return "assets/ready_to_pickup.png";
      default:
        return "assets/hint.png";
    }
  }
}
