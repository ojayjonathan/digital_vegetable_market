import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/repository/app.dart';
import 'package:market/data/services/service.dart';
import 'package:market/presentation/app/view/app.dart';

void main() {
  setUpService();
  runApp(
    RepositoryProvider.value(
      value: AppRepository.instance,
      child: const MarketApp(),
    ),
  );
}
