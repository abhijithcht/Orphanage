import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

PageTransition buildPageTransition(Widget child) {
  return PageTransition(
    child: child,
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 400),
    reverseDuration: const Duration(milliseconds: 400),
  );
}
