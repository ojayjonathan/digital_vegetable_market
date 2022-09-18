import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/presentation/app/bloc/bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double itemCount = 1;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        Expanded(
          child: Card(
            child: ListView(
              children: [
                FractionallySizedBox(
                  alignment: Alignment.center,
                  widthFactor: 0.5,
                  child: Image.network(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              widget.product.name,
                              style: const TextStyle(
                                  // color: AppTheme.darkColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          InkWell(
                            onTap: (() => setState(() {
                                  if (itemCount > 2) itemCount--;
                                })),
                            child: Image.asset(
                              "assets/images/remove_icon.png",
                              width: 32,
                              height: 32,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "$itemCount",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              // color: AppTheme.darkColor,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                itemCount++;
                              });
                            },
                            child: Image.asset(
                              "assets/images/add_icon.png",
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Ksh ${widget.product.price}/${widget.product.measurementUnit}",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.product.description ?? "",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            if (bloc.state.cart.hasProduct(widget.product)) {
                              bloc.add(
                                CartItemUpdated(
                                    product: widget.product,
                                    quantity: itemCount),
                              );
                            } else {
                              bloc.add(
                                CartItemAdded(
                                  product: widget.product,
                                  quantity: itemCount,
                                ),
                              );
                            }
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          child: const Text("Add to cart"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
