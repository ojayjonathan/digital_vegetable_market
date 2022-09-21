import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/services/status.dart';
import 'package:market/presentation/app/bloc/bloc.dart';
import 'package:market/presentation/features/user_products/bloc/bloc.dart';
import 'package:market/presentation/features/user_products/view/widgets/form_widgets.dart';
import 'package:market/presentation/widgets/bottom_navigation_bar.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/info.dart';
import 'package:market/utils/utils.dart';
part 'widgets/product_edit_form.dart';
part 'widgets/product_image.dart';

class UserProductsPage extends StatelessWidget {
  const UserProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().add(AddressStarted());
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(3),

      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Products"),
      ),
      body: BlocProvider(
        create: (_) => UserProductsCubit(),
        child: const _UserProductsView(),
      ),
    );
  }
}

class _UserProductsView extends StatelessWidget {
  const _UserProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProductsCubit, UserProductsState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is UserProductsListState) {
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: state.products.length + 1,
            itemBuilder: (context, index) {
              if (index == state.products.length) {
                return TextButton(
                  onPressed: () =>
                      context.read<UserProductsCubit>().createStarted(),
                  child: const Text("Add new"),
                );
              }
              final item = state.products[index];
              return _ProductTile(item);
            },
          );
        }

        return const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: _ProductUpdateForm(),
          ),
        );
      },
      listener: (context, state) {
        if (state.message != null) {
          context.snackBar(state.message!);
        }
      },
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile(this.product, {Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 80,
        height: 80,
      ),
      title: Text(product.name),
      subtitle: Text("Ksh ${product.price}"),
      trailing: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () =>
                context.read<UserProductsCubit>().updateStarted(product),
            child: const Text(
              "Edit",
            ),
          )
        ],
      ),
    );
  }
}
