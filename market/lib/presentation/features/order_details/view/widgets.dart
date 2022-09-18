part of 'order_details_page.dart';

class _Circle extends StatelessWidget {
  const _Circle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(color: Theme.of(context).primaryColorDark, width: 2),
      ),
      child: Icon(
        Icons.circle,
        color: Theme.of(context).primaryColorDark,
        size: 15,
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  const _OrderSummary({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
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
                  Text("Ksh ${order.cost}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Shipment"),
                  Text("Ksh ${order.shippingCost}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total"),
                  Text("Ksh ${order.shippingCost + order.cost}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DotedLine extends StatelessWidget {
  const _DotedLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          11,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300,
              height: 1,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class _OrderShipmentInformation extends StatelessWidget {
  const _OrderShipmentInformation({Key? key, required this.order})
      : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    final productAddress = order.items[0].product.address;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _Circle(),
                _DotedLine(),
                _Circle(),
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productAddress.title ?? "Product Location",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    productAddress.address ?? productAddress.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    order.address.title ?? "Shipment address",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    order.address.address ?? order.address.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderProducts extends StatelessWidget {
  const _OrderProducts(this.order, {Key? key}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: List.generate(
          order.items.length,
          (index) {
            final item = order.items[index];
            return ListTile(
              leading:
                  TextButton(onPressed: () {}, child: Text("${index + 1}")),
              title: Text(item.product.name),
              subtitle: Text("${item.product.price} \u00D7  ${item.quantity}"),
              trailing: TextButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          OrderItemTrackingPage(order: order, item: item),
                    ),
                  )
                },
                child: const Text("Track"),
              ),
            );
          },
        ),
      ),
    );
  }
}
