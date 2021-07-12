import 'package:spacex_last_mission/core/constants/constants.dart';
import 'package:spacex_last_mission/core/constants/text_constants.dart';
import 'package:spacex_last_mission/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_last_mission/service/last_mission.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LastMission>(
      builder: (context, lastMission, child) {
        final spaceXMission = lastMission.mission!;
        final redditList = [
          spaceXMission.links.reddit.campaign,
          spaceXMission.links.reddit.launch,
          spaceXMission.links.reddit.recovery
        ];
        final List<Widget> colChildren = [
          Container(
            width: context.dynamicWidth(300),
            height: context.dynamicHeight(200),
            padding: context.photoEdgeInsets,
            child: PageView(
              children: spaceXMission.links.flickr.original
                  .map((imageUrl) => Container(
                        decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                AppConstants.IMAGE_RADIUS),
                            image:  DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover)),
                      ))
                  .toList(),
            ),
          ),
          Container(
            width: context.dynamicWidth(100),
            child: Image.network(spaceXMission.links.patch.small),
          ),
        ];
        colChildren.add(Text(
          TextConstants.REDDIT_NEWS,
          style: Theme.of(context).textTheme.headline2,
        ));
        colChildren.addAll(redditList.map((link) => TextButton(
          onPressed: () => _launchURL(link),
          child: Text(
                link,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    decorationColor: Colors.white,
                    decorationThickness: 1,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid),
              ),
        )));
        return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: colChildren);
      },
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
