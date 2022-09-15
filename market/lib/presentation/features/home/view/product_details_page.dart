import 'package:flutter/material.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/presentation/widgets/bottom_navigation_bar.dart';
import 'package:market/presentation/widgets/button.dart';

class _ProductDetails extends StatelessWidget {
  const _ProductDetails(this._product, {Key? key}) : super(key: key);
  final Product _product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent),
          bottomNavigationBar: const BottomNavigation(1),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(""), fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_product.name),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Description"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_product.description ?? ""),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      AppButton(handlePress: () {}, text: "ADD TO CART"),
                      const SizedBox(width: 20),
                      AppButtonOutlined(handlePress: () {}, text: "BUY"),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

Future showProductDetails(
        {required Product product, required BuildContext context}) =>
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return _ProductDetails(product);
      },
    );
