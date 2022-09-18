part of 'cart_page.dart';

class _CartItemWidget extends StatelessWidget {
  final OrderItem item;
  const _CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            item.product.imageUrl,
            width: 80,
            height: 80,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Ksh ${item.product.price} \u00D7 ${item.quantity}",
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => item.quantity > 1
                        ? bloc.add(
                            CartItemUpdated(
                              product: item.product,
                              quantity: item.quantity - 1,
                            ),
                          )
                        : null,
                    child: Image.asset(
                      "assets/images/remove_icon.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${item.quantity}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () => bloc.add(
                      CartItemUpdated(
                        product: item.product,
                        quantity: item.quantity + 1,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/add_icon.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => bloc.add(
                  CartItemRemoved(item),
                ),
                child: 
                const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
