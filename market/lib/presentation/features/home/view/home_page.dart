import 'package:flutter/material.dart';
import 'package:market/presentation/features/home/view/widgets/paint.dart';
import 'package:market/presentation/widgets/bottom_navigation_bar.dart';

part 'widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: const BottomNavigation(0),
      body: Column(
        children: [
          Stack(
            children: [
              const Positioned(
                top: 0,
                left: 0,
                child: CurvePaint(),
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: height * 0.1),
                  _Search(),
                  SizedBox(height: height * 0.08),
                ],
              )
            ],
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
