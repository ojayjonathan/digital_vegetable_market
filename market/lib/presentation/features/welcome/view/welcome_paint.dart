part of 'welcome_page.dart';

class _WelcomePagePainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = Path();
    path.lineTo(0, size.height * 0.9);
    path.quadraticBezierTo(width * 0.25, height * 1.1, width, height * 0.5);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _WelcomePagePaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _WelcomePagePainter(),
      child: Container(
        height: MediaQuery.of(context).size.height * .25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark,
            ],
          ),
        ),
      ),
    );
  }
}
