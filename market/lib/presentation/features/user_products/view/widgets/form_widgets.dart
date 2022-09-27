import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/services/status.dart';
import 'package:market/presentation/features/checkout/view/checkout_page.dart';
import 'package:market/presentation/features/user_products/bloc/bloc.dart';

class ProductExpectedAvailableDate extends StatelessWidget {
  const ProductExpectedAvailableDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProductsCubit, UserProductsState>(
      buildWhen: (previous, current) =>
          current.availableDate != previous.availableDate ||
          current.status != previous.status,
      builder: (context, state) {
        return Card(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Available PickUp Date"),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text("Available Date"),
                subtitle: Text(
                  state.availableDate?.value?.toString() ??
                      "No availableDate selected",
                ),
                trailing: TextButton(
                  child: const Text("Select"),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 10),
                      ),
                    );
                    if (date != null) {
                      // ignore: use_build_context_synchronously
                      context.read<UserProductsCubit>().dateChanged(date);
                    }
                  },
                ),
              ),
              if (state.availableDate?.error != null &&
                  state.status == ServiceStatus.submissionFailure)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    state.availableDate?.error ?? "",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class ProductAddress extends StatelessWidget {
  const ProductAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProductsCubit, UserProductsState>(
      buildWhen: (previous, current) =>
          current.address != previous.address ||
          current.status != previous.status,
      builder: (context, state) {
        return Card(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Product Location"),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(state.address?.value?.name ?? "Address"),
                subtitle: Text(
                  state.address?.value?.address ?? "No address selected",
                ),
                trailing: TextButton(
                  child: const Text(
                    "Select",
                  ),
                  onPressed: () async {
                    final address = await showSelectAddress(context);
                    if (address != null) {
                      // ignore: use_build_context_synchronously
                      context.read<UserProductsCubit>().addressChanged(address);
                    }
                  },
                ),
              ),
              if (state.address?.error != null &&
                  state.status == ServiceStatus.submissionFailure)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    state.address?.error ?? "",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class ProductCategory extends StatelessWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProductsCubit, UserProductsState>(
      buildWhen: (previous, current) =>
          current.category?.value != previous.category?.value,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.height * .95,
          
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Category"),
                  DropdownButton<String>(
                    value: state.category?.value,
                    items: const [
                      DropdownMenuItem(
                        value: "VEGETABLES",
                        child: Text("VEGETABLES"),
                      ),
                      DropdownMenuItem(
                        value: "FRUITS",
                        child: Text("FRUITS"),
                      )
                    ],
                    onChanged: (value) {
                      context.read<UserProductsCubit>().categoryChanged(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
