import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:spacex_last_mission/core/constants/animations.dart';
import 'package:spacex_last_mission/core/constants/constants.dart';

class MilkyWay extends StatefulWidget {
  final Size screenSize;

  MilkyWay({Key? key, required this.screenSize}) : super(key: key);

  @override
  State createState() => MilkyWayState();
}

class MilkyWayState extends State<MilkyWay> with TickerProviderStateMixin {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const double durationSlowMode = 2.0;

  Color gradientStartFrom = AppConstants.LIGHT_BLACK;
  Color gradientStartTo = AppConstants.DARK_BLUE;
  Color gradientEndFrom = AppConstants.DARK_BLUE;
  Color gradientEndTo = AppConstants.LIGHT_BLACK;

  late AnimationController animControlStar, animControlPlanet, animControlBg;
  late Animation fadeAnimStar1, fadeAnimStar2, fadeAnimStar3, fadeAnimStar4, sizeAnimStar, rotateAnimStar;
  late Animation colorAnimBgStart, colorAnimBgEnd;
  late Size screenSize;
  late List<Star> listStar;
  late int numStars;

  RectTween createRectTween(Rect begin, Rect end) {
    return new MaterialRectArcTween(begin: begin, end: end);
  }

  Widget buildStar(double left, double top, double extraSize, double angle, int typeFade) {
    return new Positioned(
      child: new Container(
        child: new Transform.rotate(
          child: new Opacity(
            child: new Icon(
              Icons.star,
              color: Colors.white,
              size: sizeAnimStar.value + extraSize,
            ),
            opacity: (typeFade == 1)
                ? fadeAnimStar1.value
                : (typeFade == 2) ? fadeAnimStar2.value : (typeFade == 3) ? fadeAnimStar3.value : fadeAnimStar4.value,
          ),
          angle: angle,
        ),
        alignment: FractionalOffset.center,
        width: 10.0,
        height: 10.0,
      ),
      left: left,
      top: top,
    );
  }

  Widget buildGroupStar() {
    List<Widget> list = [];
    for (int i = 0; i < numStars; i++) {
      list.add(
          buildStar(listStar[i].left, listStar[i].top, listStar[i].extraSize, listStar[i].angle, listStar[i].typeFade));
    }

    return new Stack(
      children: list
    );
  }

  @override
  void initState() {
    super.initState();

    screenSize = widget.screenSize;
    listStar = [];
    numStars = 30;

    // Star
    animControlStar = AnimationController(vsync: this, duration: new Duration(milliseconds: 2000));
    fadeAnimStar1 = AppAnimations(animControlStar).fadeAnimStar1;
    fadeAnimStar1.addListener(() {
      setState(() {});
    });
    fadeAnimStar2 = AppAnimations(animControlStar).fadeAnimStar2;
    fadeAnimStar2.addListener(() {
      setState(() {});
    });
    fadeAnimStar3 = AppAnimations(animControlStar).fadeAnimStar3;
    fadeAnimStar3.addListener(() {
      setState(() {});
    });
    fadeAnimStar4 = AppAnimations(animControlStar).fadeAnimStar4;
    fadeAnimStar4.addListener(() {
      setState(() {});
    });
    sizeAnimStar = AppAnimations(animControlStar).sizeAnimStar;
    sizeAnimStar.addListener(() {
      setState(() {});
    });
    rotateAnimStar = AppAnimations(animControlStar).rotateAnimStar;
    rotateAnimStar.addListener(() {
      setState(() {});
    });

    animControlStar.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlStar.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animControlStar.forward();
      }
    });

    for (int i = 0; i < numStars; i++) {
      listStar.add(Star(
          left: Random().nextDouble() * screenSize.width,
          top: Random().nextDouble() * screenSize.height,
          extraSize: Random().nextDouble() * 2,
          angle: Random().nextDouble(),
          typeFade: Random().nextInt(4)));
    }

    // Background
    animControlBg = AnimationController(vsync: this, duration: new Duration(milliseconds: 5000));
    animControlBg.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlBg.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animControlBg.forward();
      }
    });

    colorAnimBgStart = new ColorTween(begin: gradientStartFrom, end: gradientStartTo).animate(animControlBg);
    colorAnimBgEnd = new ColorTween(begin: gradientEndFrom, end: gradientEndTo).animate(animControlBg);

    // Let's go
    animControlStar.forward();
    animControlBg.forward();
  }

  @override
  void dispose() {
    animControlStar.dispose();
    animControlPlanet.dispose();
    animControlBg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = durationSlowMode;

    return new Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [colorAnimBgStart.value, colorAnimBgEnd.value],
                begin: new FractionalOffset(0.0, 0.5),
                end: new FractionalOffset(0.5, 1.0),
                tileMode: TileMode.mirror)),
        child: buildGroupStar());
  }
}

class Star {
  // angle should be value 0.0 -> 1.0
  // left 0.0 -> 360.0
  // height 0.0 -> 640.0
  // typeFade 1 -> 4

  double left;
  double top;
  double extraSize;
  double angle;
  int typeFade;

  Star(
      {required this.left,
        required this.top,
        required this.extraSize,
        required this.angle,
        required this.typeFade});
}