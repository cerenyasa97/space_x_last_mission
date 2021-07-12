import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppAnimations {
  AnimationController controller;
  Color? gradientStartFrom;
  Color? gradientStartTo;
  Color? gradientEndFrom;
  Color? gradientEndTo;
  late Animation fadeAnimStar1,
      fadeAnimStar2,
      fadeAnimStar3,
      fadeAnimStar4,
      sizeAnimStar,
      rotateAnimStar,
      colorAnimBgStart,
      colorAnimBgEnd,
      sizeAnim;

  AppAnimations(this.controller,
      {this.gradientStartFrom,
      this.gradientStartTo,
      this.gradientEndFrom,
      this.gradientEndTo}) {
    fadeAnimStar1 = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.5)));
    fadeAnimStar2 = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: new Interval(0.5, 1.0)));
    fadeAnimStar3 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.5)));
    fadeAnimStar4 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: new Interval(0.5, 1.0)));
    sizeAnimStar = Tween(begin: 0.0, end: 5.0).animate(
        CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.5)));
    rotateAnimStar = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.5)));
    colorAnimBgStart =
        ColorTween(begin: gradientStartFrom, end: gradientStartTo)
            .animate(controller);
    colorAnimBgEnd = ColorTween(begin: gradientEndFrom, end: gradientEndTo)
        .animate(controller);
    sizeAnim = Tween<double>(begin: 0, end: 500).animate(controller);
  }
}
