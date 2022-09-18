import 'package:flutter/material.dart';

class CurvePainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(width * 0.5, height * 0.1, width, height * 0.25);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CurvePaint extends StatelessWidget {
  const CurvePaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvePainter(),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColorDark,
              Theme.of(context).primaryColorLight
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(width * 0.5, height * 0.5, width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ProductDetailCurvePaint extends StatelessWidget {
  const ProductDetailCurvePaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvePainter2(),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColorDark,
              Theme.of(context).primaryColorLight
            ],
          ),
        ),
      ),
    );
  }
}
