import 'package:flutter/material.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/presentation/features/order_details/view/order_details_page.dart';
import 'package:market/utils/utils.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;
  const OrderHistoryCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 5,
      child: ListTile(
         subtitle: Text("Ksh ${order.cost + order.shippingCost}"),
        title: Text("Date ${order.createdAt.format}"),
        trailing: InkWell(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderDetailsPage(order: order),
              ),
            )
          },
          child: Text(
            "View",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
