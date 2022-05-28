import 'package:flutter/material.dart';
import 'package:vegetable_marketplace/modules/auth/login/ui/login_page.dart';
import 'package:vegetable_marketplace/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
