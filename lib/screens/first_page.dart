import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_last_mission/core/constants/animations.dart';
import 'package:spacex_last_mission/core/constants/image_constants.dart';
import 'package:spacex_last_mission/core/constants/text_constants.dart';
import 'package:spacex_last_mission/core/extensions/context_extension.dart';
import 'package:spacex_last_mission/service/last_mission.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation sizeAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    sizeAnim = AppAnimations(_controller).sizeAnim;
    _controller.forward();
    _controller.addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          TextConstants.TITLE,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        Container(
          height: context.dynamicHeight(sizeAnim.value),
          width: context.dynamicWidth(sizeAnim.value / 2),
          child: Image.asset(
            ImageConstants.ROCKET,
            fit: BoxFit.scaleDown,
          ),
        ),
        Consumer<LastMission>(
          builder: (context, lastMission, child) => Text(
            lastMission.mission!.name,
            style: textStyle,
          ),
        )
      ],
    );
  }
}
