import 'package:flutter/material.dart';

enum PageTransitionType { fade, slide, scale }

class AnimatedPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final PageTransitionType type;
  AnimatedPageRoute({required this.child, this.type = PageTransitionType.fade})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (type) {
              case PageTransitionType.fade:
                return FadeTransition(opacity: animation, child: child);
              case PageTransitionType.slide:
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
                  child: child,
                );
              case PageTransitionType.scale:
                return ScaleTransition(scale: animation, child: child);
            }
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
} 