import 'package:flutter/material.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/presentation/features/home/view/widgets/details.dart';
import 'package:market/presentation/features/home/view/widgets/paint.dart';

class _ProductDetails extends StatelessWidget {
  const _ProductDetails(this._product, {Key? key}) : super(key: key);
  final Product _product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProductDetailCurvePaint(),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ProductDetailScreen(
                product: _product,
              ),
            ),
          ),
        )
      ],
    );
  }
}

Future showProductDetails({
  required Product product,
  required BuildContext context,
}) =>
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
