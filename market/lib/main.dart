import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/repository/app.dart';
import 'package:market/data/repository/shopping.dart';
import 'package:market/data/services/service.dart';
import 'package:market/presentation/app/view/app.dart';

void main() {
  setUpService();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: AppRepository.instance,
        ),
        RepositoryProvider(create: (_) => ShoppingRepository()),
      ],
      child: const MarketApp(),
    ),
  );
}
