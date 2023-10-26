import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  final Duration duration;
  final bool reverseTransition;

  PageTransition({
    required this.enterPage,
    required this.exitPage,
    this.duration = const Duration(milliseconds: 300),
    this.reverseTransition = false,
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = Offset(reverseTransition ? 1.0 : -1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);

            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          // Set the exitPage to transparent so that it doesn't show up during the transition
          opaque: false,
          barrierDismissible: false,
          fullscreenDialog: false,
          maintainState: true,
        );
}
