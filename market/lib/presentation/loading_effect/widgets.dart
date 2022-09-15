import 'package:flutter/material.dart';
import 'package:market/presentation/loading_effect/shimmer_loading.dart';

class TileLoading extends StatelessWidget {
  const TileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: ShimmerLoading(
          child: CircleAvatar(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: 90,
              height: 90,
            ),
          ),
        ),
        title: ShimmerLoading(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 18,
            width: MediaQuery.of(context).size.width * .4,
          ),
        ),
        subtitle: ShimmerLoading(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 16,
            width: MediaQuery.of(context).size.width * .3,
          ),
        ),
      );
}

class ContainerLoading extends StatelessWidget {
  final double height;
  final double width;
  const ContainerLoading({this.height = 18, required this.width, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
