import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/repository/shopping.dart';
import 'package:market/data/services/status.dart';
import 'package:market/presentation/features/home/bloc/bloc.dart';
import 'package:market/presentation/features/home/view/product_details_page.dart';
import 'package:market/presentation/features/home/view/widgets/paint.dart';
import 'package:market/presentation/loading_effect/shimmer.dart';
import 'package:market/presentation/loading_effect/shimmer_loading.dart';
import 'package:market/presentation/loading_effect/widgets.dart';
import 'package:market/presentation/widgets/bottom_navigation_bar.dart';
import 'package:market/resources/info.dart';

part 'widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(0),
      body: BlocProvider(
        create: (context) => ProductBloc(
          context.read<ShoppingRepository>(),
        )..add(ProductStated()),
        child: const _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            const CurvePaint(),
            Column(
              children: <Widget>[
                SizedBox(height: height * 0.1),
                _Search(),
              ],
            )
          ],
        ),
        RefreshIndicator(
          onRefresh: () {
            context.read<ProductBloc>().add(ProductStated());
            return Future.delayed(const Duration(seconds: 3));
          },
          child: Expanded(
            child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state.message != null) {
                  context.snackBar(state.message!);
                }
              },
              buildWhen: (previous, current) =>
                  previous.productsPage != current.productsPage ||
                  current.status != previous.status,
              builder: (context, state) {
                if (state.status == ServiceStatus.loading) {
                  return Shimmer(
                    child: GridView.count(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      childAspectRatio: .8,
                      children: List.generate(
                        4,
                        (index) => const _ProductCardLoading(),
                      ),
                    ),
                  );
                }

                return GridView.count(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  childAspectRatio: .8,
                  children: state.productsPage.products
                      .map(
                        (product) => _ProductCard(product: product),
                      )
                      .toList(),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
