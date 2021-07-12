import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_last_mission/core/components/milky_way.dart';
import 'package:spacex_last_mission/screens/second_page.dart';
import 'package:spacex_last_mission/screens/third_page.dart';
import 'package:spacex_last_mission/service/last_mission.dart';
import '../core/components/transition_indicator_dot.dart';
import '../core/extensions/context_extension.dart';
import 'first_page.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> pageList = [FirstPage(), SecondPage(), ThirdPage()];
  final ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MilkyWay(screenSize: MediaQuery.of(context).size),
        SafeArea(
          child: Row(
            children: [
              Container(
                width: context.dynamicWidth(40),
                height: context.dynamicHeight(100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    pageList.length,
                    (index) => ValueListenableBuilder<int>(
                      valueListenable: _pageIndex,
                      builder: (context, value, child) => TransitionIndicatorDot(
                        currentPageIndex: value,
                        currentContainerIndex: index,
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<LastMission>(builder: (context, lastMission, child) {
                return lastMission.mission != null ? Container(
                  width: context.dynamicWidth(350),
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (currentPage) => _pageIndex.value = currentPage,
                    scrollDirection: Axis.vertical,
                    children: pageList,
                  ),
                ) : Center(child: CircularProgressIndicator(color: Colors.white,),);
              })
            ],
          ),
        ),
      ],
    ));
  }
}