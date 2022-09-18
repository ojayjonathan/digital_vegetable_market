import 'package:flutter/material.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/presentation/features/order_details/view/order_product_track.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/info.dart';

part 'widgets.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({required this.order, Key? key}) : super(key: key);
  final Order order;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late Order order;
  @override
  void initState() {
    order = widget.order;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _OrderShipmentInformation(order: order),
              const SizedBox(
                height: 10,
              ),
              _OrderProducts(order),
              _OrderSummary(order: order),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
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
                                  text: "Status",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorLight,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: "\t\t ${order.status.toStr()}",
                                style: const TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (order.status == OrderStatus.PENDING)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              handlePress: () async {
                                final res = await service<OrderService>()
                                    .update(order.id!);
                                res.when(
                                  onError: (error) => context.snackBar(
                                    InfoMessage.fromError(error),
                                  ),
                                  onSuccess: (data) {
                                    context.snackBar(
                                      const InfoMessage(
                                          message: "Order Cancelled",
                                          type: MessageType.success),
                                    );
                                    setState(() {
                                      order = data;
                                    });
                                  },
                                );
                              },
                              text: "CANCEL",
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
