import 'package:flutter/material.dart';

//Create a transition that fades in the new view, while fading out a white background
class FadePageRoute extends PageRouteBuilder {
  final Widget page;

  FadePageRoute({required this.page})
      : super(
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var fadeIn = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                    curve: const Interval(0.7, 1), parent: animation),
              );
              var fadeOut = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                    curve: const Interval(0, 0.2), parent: animation),
              );
              return Stack(
                children: [
                  FadeTransition(
                    opacity: fadeOut,
                    child: Container(color: Theme.of(context).canvasColor),
                  ),
                  FadeTransition(opacity: fadeIn, child: child)
                ],
              );
            });
}
