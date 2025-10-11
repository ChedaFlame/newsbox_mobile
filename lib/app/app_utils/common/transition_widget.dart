import 'package:flutter/material.dart';

class CircularRevealInRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  CircularRevealInRoute({required this.builder})
      : super(
    transitionDuration: Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut;
      var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

      return AnimatedBuilder(
        animation: curvedAnimation,
        builder: (context, child) {
          return ClipPath(
            clipper: CircularRevealClipper(
              fraction: curvedAnimation.value,
            ),
            child: child,
          );
        },
        child: child,
      );
    },
  );
}

class CircularRevealOutRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  CircularRevealOutRoute({required this.builder})
      : super(
    transitionDuration: Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut;
      var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

      return AnimatedBuilder(
        animation: curvedAnimation,
        builder: (context, child) {
          return ClipPath(
            clipper: CircularRevealClipper(
              fraction: curvedAnimation.value,
              origin: Offset(1.0, 0.2), // Start from top-right// Reverse the animation
            ),
            child: child,
          );
        },
        child: child,
      );
    },
  );
}

class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset origin;

  CircularRevealClipper({required this.fraction, this.origin = const Offset(0.5, 0.5)});

  @override
  Path getClip(Size size) {
    var path = Path();
    var radius = size.height * fraction;
    var center = Offset(size.width * origin.dx, size.height * origin.dy);
    path.addOval(Rect.fromCircle(
      center: center,
      radius: radius,
    ));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

