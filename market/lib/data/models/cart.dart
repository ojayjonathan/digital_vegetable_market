import 'package:equatable/equatable.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/models/product/product.dart';

class Cart extends Equatable {
  final List<OrderItem> items;
  const Cart({this.items = const []});

  Cart copyWith({List<OrderItem>? items}) => Cart(items: items ?? this.items);

  bool hasProduct(Product product) {
    for (var item in items) {
      if (item.product == product) return true;
    }
    return false;
  }

  int get count => items.length;
  double get cost => items.fold(
        0,
        (previous, item) => previous + item.quantity * item.product.price,
      );

  @override
  List<Object?> get props => [items];
}
