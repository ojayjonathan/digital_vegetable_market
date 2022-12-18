import 'package:market/data/models/address/address.dart';
import 'package:market/data/repository/app.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/presentation/features/account/bloc/bloc.dart';
import 'package:market/presentation/features/account/view/widgets.dart';
import 'package:market/presentation/features/address_search/view/map_location_picker.dart';
import 'package:market/presentation/loading_effect/shimmer.dart';
import 'package:market/presentation/loading_effect/widgets.dart';
import 'package:market/presentation/widgets/bottom_navigation_bar.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/app_routes.dart';
import 'package:market/resources/info.dart';
import 'package:market/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part "password_change.dart";

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AccountBloc>().add(AccountStarted());
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Account Details"),
        actions: [
          BlocBuilder<AccountBloc, AccountState>(
            buildWhen: (previous, current) => previous.user == null,
            builder: (context, state) {
              if (state.user == null) return const SizedBox();
              return IconButton(
                onPressed: () => context.pushNamed(RouteNames.profileUpdate),
                icon: const Icon(Icons.edit),
              );
            },
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: _AccountView(),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.message != null) {
          context.snackBar(state.message!);
        }
      },
      buildWhen: (previous, current) => current.user != previous.user,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileImage(),
          if (state.user != null) ...[
            Text(
              state.user!.firstName,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Text(
              state.user!.email,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
          if (state.user == null)
            Shimmer(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ContainerLoading(
                    width: MediaQuery.of(context).size.width * .8,
                  ),
                  const SizedBox(height: 10),
                  ContainerLoading(
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class _FavoriteAddressView extends StatelessWidget {
  const _FavoriteAddressView();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AccountBloc>();
    return Column(
      children: [
        const Divider(height: 1, thickness: 1),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Favorite Addresses",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        BlocBuilder<AccountBloc, AccountState>(
          buildWhen: (previous, current) => current.home != previous.home,
          builder: (context, state) {
            Address? home = state.home;
            return ListTile(
              title: const Text("Home Address"),
              leading: const Icon(Icons.home_outlined),
              subtitle: home != null ? Text(home.name) : null,
              trailing: TextButton(
                onPressed: () async {
                  var loc = await showAddressPicker(context);
                  if (loc != null) {
                    loc = loc.copyWith(title: "HOME");
                    bloc.add(
                      home == null
                          ? AddressCreated(loc)
                          : AddressUpdate(
                              loc,
                              home.id.toString(),
                            ),
                    );
                  }
                },
                child: Text(home == null ? "Add" : "Update"),
              ),
            );
          },
        ),
        BlocBuilder<AccountBloc, AccountState>(
          buildWhen: (previous, current) => current.work != previous.work,
          builder: (context, state) {
            Address? work = state.work;
            return ListTile(
              title: const Text("Work Address"),
              leading: const Icon(Icons.work_outline_outlined),
              subtitle: work != null ? Text(work.name) : null,
              trailing: TextButton(
                onPressed: () async {
                  var loc = await showAddressPicker(context);
                  if (loc != null) {
                    loc = loc.copyWith(title: "WORK");
                    bloc.add(
                      work == null
                          ? AddressCreated(loc)
                          : AddressUpdate(
                              loc,
                              work.id.toString(),
                            ),
                    );
                  }
                },
                child: Text(work == null ? "Add" : "Update"),
              ),
            );
          },
        ),
        const Divider(height: 1, thickness: 1),
      ],
    );
  }
}

class _AccountView extends StatelessWidget {
  const _AccountView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) => current.user != previous.user,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _ProfileView(),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => context.pushNamed(RouteNames.wallet),
                  child: const ListItem(
                    desc: "Account balance",
                    imagePath: "assets/wallet.png",
                    title: "Wallet",
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () => context.pushNamed(RouteNames.userProducts),
                  child: const ListItem(
                    title: "Products",
                    imagePath: "assets/list.png",
                    desc: "My products",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => context.pushNamed(RouteNames.orderHistory),
                  child: const ListItem(
                    desc: "Order History",
                    imagePath: "assets/package.png",
                    title: "Orders",
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => context.pushNamed(RouteNames.manual),
                  child: const ListItem(
                    desc: "Contact & Help",
                    imagePath: "assets/package.png",
                    title: "Help",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const _FavoriteAddressView(),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _PasswordChange(),
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.edit),
                SizedBox(width: 10),
                Text("Change Password")
              ],
            ),
          ),
          TextButton(
            onPressed: () => context.read<AppRepository>().logout(),
            child: Row(
              children: const [
                Icon(Icons.exit_to_app),
                SizedBox(width: 10),
                Text("Logout")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
