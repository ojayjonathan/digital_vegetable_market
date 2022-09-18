import 'package:flutter/material.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/presentation/widgets/button.dart';

part 'widgets.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({required this.order, Key? key}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Order"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _OrderShipmentInformation(order: order),
              const SizedBox(
                height: 30,
              ),
              _OrderSummary(order: order),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Ksh 100",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(
                              text: "\t\t Pending",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AppButton(
                        handlePress: () {},
                        text: "COMPLETE THE ORDER",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
