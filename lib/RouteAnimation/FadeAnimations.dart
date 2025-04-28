// Function to create drop, fade, and scale transition
import 'package:flutter/material.dart';

Route createDropFadeRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade transition
      var fadeTween = Tween(begin: 0.0, end: 1.0)
          .chain(CurveTween(curve: Curves.easeIn));
      var fadeAnimation = animation.drive(fadeTween);

      // // Slide (drop) transition
      // var slideTween = Tween(begin: const Offset(0.0, 0.7), end: Offset.zero)
      //     .chain(CurveTween(curve: Curves.easeInOut));
      // var slideAnimation = animation.drive(slideTween);

      // Scale transition
      var scaleTween = Tween(begin: 0.9, end: 1.0) // Slight zoom-in effect
          .chain(CurveTween(curve: Curves.easeIn));
      var scaleAnimation = animation.drive(scaleTween);

      return ScaleTransition(
        scale: scaleAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: child,
        ),
      );
    },
  );
}