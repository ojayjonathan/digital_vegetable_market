import 'dart:math' as math show sin, pi;

import 'package:flutter/material.dart';

class DelayTween extends Tween<double> {
  DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class ThreeBounce extends StatefulWidget {
  const ThreeBounce({
    Key? key,
    this.color,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 1400),
  }) : super(key: key);

  final Color? color;
  final double size;
  final Duration duration;

  @override
  State<ThreeBounce> createState() => _SpinKitThreeBounceState();
}

class _SpinKitThreeBounceState extends State<ThreeBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 2, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            3,
            (i) {
              return ScaleTransition(
                scale: DelayTween(begin: 0.0, end: 1.0, delay: i * .2)
                    .animate(_controller),
                child: SizedBox.fromSize(
                  size: Size.square(widget.size * 0.5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: widget.color ?? Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
