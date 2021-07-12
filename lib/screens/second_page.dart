import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_last_mission/core/constants/text_constants.dart';
import 'package:spacex_last_mission/service/last_mission.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SecondPage extends StatelessWidget {

  late YoutubePlayerController _controller;

  SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LastMission>(
        builder: (context, lastMission, child) {
          _controller = YoutubePlayerController(
            initialVideoId: lastMission.mission!.links.youtubeId,
            flags: YoutubePlayerFlags(
              autoPlay: false,
              mute: true,
            ),
          );
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  lastMission.mission!.name + " " + TextConstants.LAST_MISSION,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Flexible(
                flex: 2,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.white,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  lastMission.mission!.details,
                  maxLines: 20,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        }
    );
  }
}