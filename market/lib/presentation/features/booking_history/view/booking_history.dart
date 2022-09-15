import 'package:market/presentation/features/booking_history/bloc/bloc.dart';
import 'package:market/presentation/features/booking_history/view/widgets.dart';
import 'package:market/resources/info.dart';
import 'package:market/data/services/status.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideHistory extends StatelessWidget {
  const RideHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ride History'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => OrderHistoryBloc()
            ..add(
              OrderHistoryStarted(),
            ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Showing Recent Rides',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                const _OrderHistoryView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OrderHistoryView extends StatelessWidget {
  const _OrderHistoryView();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<OrderHistoryBloc>().add(OrderHistoryRefreshed());
      },
      child: BlocConsumer<OrderHistoryBloc, OrderHistoryState>(
        listener: (context, state) {
          if (state.message != null) {
            context.snackBar(state.message!);
          }
        },
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status == ServiceStatus.loading) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (state.status == ServiceStatus.loadingFailure) {
            return const Text("An error occured");
          }
          if (state.status == ServiceStatus.loadingSuccess &&
              state.orders.isEmpty) {
            return const Text("You have not made any Order");
          }
          return ListView.builder(
            itemCount: state.orders.length,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                RideHistoryCard(order: state.orders[index]),
          );
        },
      ),
    );
  }
}
