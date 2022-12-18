import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market/data/models/cart.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/presentation/app/bloc/bloc.dart';
import 'package:market/presentation/widgets/bottom_navigation_bar.dart';
import 'package:market/resources/app_routes.dart';

part 'widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Cart"),
      ),
      body: Stack(
        children: [
          Expanded(
            child: BlocBuilder<AppBloc, AppState>(
              buildWhen: (previous, current) => current.cart != previous.cart,
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state.cart.items.isEmpty)
                        Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            child: const Text("Your cart is Empty"),
                          ),
                        ),
                      Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 10),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: state.cart.count,
                          itemBuilder: (context, index) {
                            return _CartItemWidget(
                              item: state.cart.items[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      _CartSummary(state.cart),
                      if(state.cart.items.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text("*You have items in your cart. \n*Press the button bellow to proceed and complete your order."),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16, right: 16, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      if (context.read<AppBloc>().state.cart.count > 0) {
                        context.pushNamed(RouteNames.checkout);
                      }
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        backgroundColor: Theme.of(context).primaryColor),
                    child: const Text("Proceed to checkout"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  const _CartSummary(this.cart, {Key? key}) : super(key: key);
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price"),
                  Text("Ksh ${cart.cost}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Shipment"),
                  Text("Ksh 0"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total"),
                  Text("Ksh ${0 + cart.cost}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
