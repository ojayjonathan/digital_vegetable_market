import 'package:market/data/models/cart.dart';
import 'package:market/data/models/http/http.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';

class ShoppingRepository {
  final List<ProductsPage> _productPages = [];
  Cart cart = const Cart();
  List<Product> get products => _productPages.fold(
        [],
        (previousValue, element) => [...previousValue, ...element.products],
      );

  Future<HttpResult<ProductsPage>> productsPage({
    page = 1,
    count = 10,
  }) async {
    for (var p in _productPages) {
      if (p.currentPage == page) {
        return HttpResult.onSuccess(data: p);
      }
    }
    final res = await service<ProductService>().all(count: count, page: page);
    res.when(onError: (err) {}, onSuccess: (data) => _productPages.add(data));
    return res;
  }

  Cart removeFromCart(OrderItem item) {
    cart = cart.copyWith(
      items: cart.items.where((item_) => item_ != item).toList(),
    );
    return cart;
  }

  Cart addToCart(OrderItem item) {
    cart = cart.copyWith(items: [...cart.items, item]);
    return cart;
  }

  Cart clearCart() {
    cart = const Cart();
    return cart;
  }

  Cart updateCartItem(Product product, double quantity) {
    cart = cart.copyWith(
      items: cart.items.map((item) {
        if (item.product == product) return item.copyWith(quantity: quantity);
        return item;
      }).toList(),
    );
    return cart;
  }
}