part of '../home_page.dart';

class _Search extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductBloc>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 10,
              shadowColor: Colors.grey[300],
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0x00ffffff),
                  hintText: "Search",
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
                onEditingComplete: () {
                  bloc.add(
                    ProductSearched(_controller.text),
                  );
                  _controller.clear();
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              bloc.add(
                ProductSearched(_controller.text),
              );
              _controller.clear();
              FocusScope.of(context).unfocus();
            },
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      product.imageUrl,
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Text(product.name),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Ksh ${product.price}/${product.measurementUnit}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {
                  showProductDetails(product: product, context: context);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                child: const Text("View"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCardLoading extends StatelessWidget {
  const _ProductCardLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ContainerLoading(
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: ContainerLoading(
              width: MediaQuery.of(context).size.width * .5,
              height: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ContainerLoading(
              width: MediaQuery.of(context).size.width * .6,
              height: 20,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ShimmerLoading(
              child: FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  child: const Text("View"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
