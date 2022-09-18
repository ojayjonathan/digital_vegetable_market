import 'package:flutter/material.dart';
import 'package:market/data/models/order/order.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;
  const OrderHistoryCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shadowColor: Colors.grey.shade300,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${order.address.address}"),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          11,
                          (index) => Expanded(
                                child: Container(
                                  color: index % 2 == 0
                                      ? Colors.transparent
                                      : Colors.grey.shade300,
                                  height: 1,
                                  width: 2,
                                ),
                              )),
                    ),
                  ),
                  Row(
                    children: [
                      Transform.rotate(
                        angle: -45,
                        child: Icon(
                          Icons.send_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${order.address.address}"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(order.createdAt.toIso8601String()),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Uba",
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Ksh ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
