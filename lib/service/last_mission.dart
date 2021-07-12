import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:spacex_last_mission/model/SpaceXLastMission.dart';
import 'package:spacex_last_mission/service/app_service.dart';

class LastMission extends ChangeNotifier{

  AppService service = AppService();
  SpaceXLastMission? mission;

  LastMission() {
    fetchMission();
  }

  fetchMission() async{
    String response = await service.fetchData('https://api.spacexdata.com/v4/launches/latest');
    notifyListeners();
    mission = SpaceXLastMission.fromMap(jsonDecode(response));
    print(mission == null ? "null" : mission!.rocket);
  }
}