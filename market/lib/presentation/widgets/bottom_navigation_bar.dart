import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market/presentation/app/bloc/bloc.dart';
import 'package:market/resources/app_routes.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(this.index, {Key? key}) : super(key: key);
  final int index;
  static const routeNames = {
    0: RouteNames.home,
    1: RouteNames.cart,
    2: RouteNames.orderHistory,
    3: RouteNames.account
  };
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,

      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: (value) => context.goNamed(routeNames[value]!),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: CartIcon(),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "Account",
        ),
      ],
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.cart.count != current.cart.count,
      builder: (context, state) => SizedBox(
        width: kToolbarHeight,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.passthrough,
          children: [
            const Icon(Icons.shopping_cart_outlined),
            Positioned(
              top: 0,
              right: 10,
              child: Container(
                width: 20,
                height: 20,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[400],
                ),
                child: Center(
                  child: Text(
                    "${state.cart.count}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
