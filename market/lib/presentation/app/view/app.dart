import 'package:market/data/repository/app.dart';
import 'package:market/data/repository/shopping.dart';
import 'package:market/presentation/app/bloc/bloc.dart';
import 'package:market/presentation/features/account/bloc/bloc.dart';
import 'package:market/presentation/features/account/view/account_page.dart';
import 'package:market/presentation/features/account_update/view/profile_page.dart';
import 'package:market/presentation/features/cart/view/cart_page.dart';
import 'package:market/presentation/features/checkout/view/checkout_page.dart';
import 'package:market/presentation/features/feedback/feedback.dart';
import 'package:market/presentation/features/home/view/home_page.dart';
import 'package:market/presentation/features/login/view/login_page.dart';
import 'package:market/presentation/features/order_history/view/order_history_page.dart';
import 'package:market/presentation/features/register/view/register_page.dart';
import 'package:market/presentation/features/reset_password/view/reset_password.dart';
import 'package:market/presentation/features/splash/splash_page.dart';
import 'package:market/presentation/features/user_products/view/user_product_page.dart';
import 'package:market/presentation/features/wallet/view/wallet_page.dart';
import 'package:market/presentation/features/welcome/view/welcome_page.dart';
import 'package:market/resources/theme.dart';
import 'package:market/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MarketApp extends StatelessWidget {
  const MarketApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authRepo = context.read<AppRepository>();
    final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(authRepo.stream),
      redirect: (state) {
        String loc = state.location;
        bool isAuthenticated =
            authRepo.status == AuthenticationStatus.authenticated;
        AuthenticationStatus.authenticated;
        //Redirect unauthenticated user to login
        if (!isAuthenticated && loc.startsWith("/app")) {
          return state.namedLocation(RouteNames.login);
        }
        if (isAuthenticated && !loc.startsWith("/app")) {
          return state.namedLocation(RouteNames.home);
        }
        return null;
      },
      routes: [
        GoRoute(
          name: RouteNames.login,
          path: "/auth/${RouteNames.login}",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          name: RouteNames.welcome,
          path: "/${RouteNames.welcome}",
          builder: (context, state) => const WelcomePage(),
        ),
        GoRoute(
          path: "/auth/${RouteNames.register}",
          name: RouteNames.register,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          name: RouteNames.splash,
          path: "/",
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          name: RouteNames.resetPassword,
          path: "/${RouteNames.resetPassword}",
          builder: (context, state) => const ResetPasswordPage(),
        ),

        //------------------------------------------------------//
        // Only authenticated user should access this routes//
        //------------------------------------------------------//
        GoRoute(
          path: "/app",
          name: RouteNames.home,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: RouteNames.account,
              name: RouteNames.account,
              builder: (context, state) => const AccountPage(),
              routes: [
                GoRoute(
              path: RouteNames.wallet,
              name: RouteNames.wallet,
              builder: (context, state) =>  WalletPage(),
            ),
              ],
            ),

             GoRoute(
              path: RouteNames.userProducts,
              name: RouteNames.userProducts,
              builder: (context, state) => const UserProductsPage(),
            ),
            GoRoute(
              path: RouteNames.checkout,
              name: RouteNames.checkout,
              builder: (context, state) => const CheckoutPage(),
            ),
            GoRoute(
              path: RouteNames.cart,
              name: RouteNames.cart,
              builder: (context, state) => const CartPage(),
            ),
            GoRoute(
              name: RouteNames.feedback,
              path: RouteNames.feedback,
              builder: (context, state) => const FeedBackPage(),
            ),
            GoRoute(
              name: RouteNames.orderHistory,
              path: RouteNames.orderHistory,
              builder: (context, state) => const OrderHistory(),
            ),
            GoRoute(
              name: RouteNames.profileUpdate,
              path: RouteNames.profileUpdate,
              builder: (context, state) => const AccountUpdatePage(),
            ),
          ],
        )
        //------------------------------------------------------------//
      ],
      initialLocation: "/",
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AccountBloc(context.read<AppRepository>())),
        BlocProvider(
          create: (context) => AppBloc(
            context.read<ShoppingRepository>(),
            context.read<AppRepository>(),
          ),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        title: 'Fruits and vegetable market',
        theme: AppTheme.lightTheme,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
