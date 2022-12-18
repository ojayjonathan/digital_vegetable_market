import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/cart.dart';
import 'package:market/data/repository/app.dart';
import 'package:market/presentation/app/bloc/bloc.dart';
import 'package:market/presentation/features/address_search/view/map_location_picker.dart';
import 'package:market/resources/info.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().add(AddressStarted());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Checkout"),
      ),
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state.message != null) {
            context.snackBar(state.message!);
          }
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    const _ShipmentAddress(),
                    const _OrderSummary(),
                    const SizedBox(height: 10),
                    const Text("Payment Mpesa Number"),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Phone Number"),
                        prefixIcon: Icon(Icons.call),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue:
                          context.read<AppRepository>().user?.phoneNumber,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "To place your an order: \n\n"
                      "\t1. Select Shippment Address (press edit button above).\n"
                      "\t2. Press Place Order button on the bottom of the screen\n"
                      "\t3. Your will receive a payment prompt",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: () => context.read<AppBloc>().add(
                            OrderPlaced(),
                          ),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          backgroundColor: Theme.of(context).primaryColor),
                      child: const Text("Place Order"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ShipmentAddress extends StatelessWidget {
  const _ShipmentAddress();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          current.selectedAddress != previous.selectedAddress,
      builder: (context, state) {
        return Card(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Shipment Address"),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(state.selectedAddress?.name ?? "Address"),
                subtitle: Text(
                  state.selectedAddress?.address ?? "No address selected",
                ),
                trailing: TextButton(
                  child: Text(
                    state.selectedAddress == null ? "Select" : "Edit",
                  ),
                  onPressed: () async {
                    final address = await showSelectAddress(context);
                    if (address != null) {
                      // ignore: use_build_context_synchronously
                      context.read<AppBloc>().add(AddressSelected(address));
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OrderSummary extends StatelessWidget {
  const _OrderSummary({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Cart cart = context.read<AppBloc>().state.cart;
    return Card(
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Summary"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Goods price"),
                  Text("Ksh ${cart.cost}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Shipment"),
                  Text("Ksh 0"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Tax"),
                  Text("Ksh 0"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total"),
                  Text("Ksh ${0 + cart.cost}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Address?> showSelectAddress(
  BuildContext context,
) =>
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text("Shipment Address"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .pop(context.read<AppBloc>().state.selectedAddress);
              },
            ),
          ),
          body: Stack(
            children: [
              BlocConsumer<AppBloc, AppState>(
                listener: (context, state) {
                  if (state.message != null) {
                    context.snackBar(state.message!);
                  }
                },
                buildWhen: (previous, current) =>
                    current.address != previous.address ||
                    current.selectedAddress != previous.selectedAddress,
                builder: (context, state) => ListView.builder(
                  itemCount: state.address.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final address = state.address[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pop(address);
                        },
                        leading: InkWell(
                          onTap: () => context.read<AppBloc>().add(
                                AddressDeleted(address),
                              ),
                          child: const Icon(Icons.delete, color: Colors.red),
                        ),
                        title: Text(address.title ?? ""),
                        subtitle: Text(address.address ?? address.name),
                        trailing: Checkbox(
                          onChanged: (value) {
                            if (value == true) {
                              Navigator.of(context).pop(address);
                            }
                          },
                          value: address == state.selectedAddress,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () async {
                    final address = await showAddressPicker(context);
                    if (address != null) {
                      // ignore: use_build_context_synchronously
                      context.read<AppBloc>().add(AddressCreated(address));
                    }
                  },
                  child: const Text("Add New Address"),
                ),
              )
            ],
          ),
        );
      },
    );
