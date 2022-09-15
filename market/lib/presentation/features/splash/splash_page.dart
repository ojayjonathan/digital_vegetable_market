import 'package:market/data/repository/app.dart';
import 'package:market/resources/app_routes.dart';
import 'package:market/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final token = await getAuthToken();
    if (token != null && mounted) {
      context.read<AppRepository>().login(token);
    } else if (mounted) {
      GoRouter.of(context).goNamed(RouteNames.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5E5FC),
      body: Center(
        child: Image.asset(
          "assets/logo-dark.png",
          width: 300,
        ),
      ),
    );
  }
}
