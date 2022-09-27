import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/app_routes.dart';
part 'welcome_paint.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.6,
                    child: _WelcomePagePaint(),
                  ),
                  SizedBox(
                    height: height * 0.6,
                    child: Center(
                      child: Image.asset(
                        "assets/logo-light.png",
                        width: width * 0.75,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    handlePress: () => context.goNamed(RouteNames.login),
                    text: "Login",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  width: double.infinity,
                  child: AppButtonOutlined(
                      handlePress: () => context.goNamed(RouteNames.register),
                      text: "Register"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
