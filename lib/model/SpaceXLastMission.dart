// To parse this JSON data, do
//
//     final spaceXLastMission = spaceXLastMissionFromMap(jsonString);


import 'dart:convert';

SpaceXLastMission spaceXLastMissionFromMap(String str) => SpaceXLastMission.fromMap(json.decode(str));

String spaceXLastMissionToMap(SpaceXLastMission data) => json.encode(data.toMap());

class SpaceXLastMission {
  SpaceXLastMission({
    required this.fairings,
    required this.links,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.tbd,
    required this.net,
    required this.window,
    required this.rocket,
    required this.success,
    required this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    required this.launchpad,
    required this.autoUpdate,
    required this.launchLibraryId,
    required this.failures,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.upcoming,
    required this.cores,
    required this.id,
  });

  Fairings fairings;
  Links links;
  DateTime staticFireDateUtc;
  int staticFireDateUnix;
  bool tbd;
  bool net;
  int window;
  String rocket;
  bool success;
  String details;
  List<dynamic> crew;
  List<String> ships;
  List<dynamic> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  String launchLibraryId;
  List<dynamic> failures;
  int flightNumber;
  String name;
  DateTime dateUtc;
  int dateUnix;
  DateTime dateLocal;
  String datePrecision;
  bool upcoming;
  List<Core> cores;
  String id;

  factory SpaceXLastMission.fromMap(Map<String, dynamic> json) => SpaceXLastMission(
    fairings: Fairings.fromMap(json["fairings"]),
    links: Links.fromMap(json["links"]),
    staticFireDateUtc: DateTime.parse(json["static_fire_date_utc"]),
    staticFireDateUnix: json["static_fire_date_unix"],
    tbd: json["tbd"],
    net: json["net"],
    window: json["window"],
    rocket: json["rocket"],
    success: json["success"],
    details: json["details"],
    crew: List<dynamic>.from(json["crew"].map((x) => x)),
    ships: List<String>.from(json["ships"].map((x) => x)),
    capsules: List<dynamic>.from(json["capsules"].map((x) => x)),
    payloads: List<String>.from(json["payloads"].map((x) => x)),
    launchpad: json["launchpad"],
    autoUpdate: json["auto_update"],
    launchLibraryId: json["launch_library_id"],
    failures: List<dynamic>.from(json["failures"].map((x) => x)),
    flightNumber: json["flight_number"],
    name: json["name"],
    dateUtc: DateTime.parse(json["date_utc"]),
    dateUnix: json["date_unix"],
    dateLocal: DateTime.parse(json["date_local"]),
    datePrecision: json["date_precision"],
    upcoming: json["upcoming"],
    cores: List<Core>.from(json["cores"].map((x) => Core.fromMap(x))),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "fairings": fairings.toMap(),
    "links": links.toMap(),
    "static_fire_date_utc": staticFireDateUtc.toIso8601String(),
    "static_fire_date_unix": staticFireDateUnix,
    "tbd": tbd,
    "net": net,
    "window": window,
    "rocket": rocket,
    "success": success,
    "details": details,
    "crew": List<dynamic>.from(crew.map((x) => x)),
    "ships": List<dynamic>.from(ships.map((x) => x)),
    "capsules": List<dynamic>.from(capsules.map((x) => x)),
    "payloads": List<dynamic>.from(payloads.map((x) => x)),
    "launchpad": launchpad,
    "auto_update": autoUpdate,
    "launch_library_id": launchLibraryId,
    "failures": List<dynamic>.from(failures.map((x) => x)),
    "flight_number": flightNumber,
    "name": name,
    "date_utc": dateUtc.toIso8601String(),
    "date_unix": dateUnix,
    "date_local": dateLocal.toIso8601String(),
    "date_precision": datePrecision,
    "upcoming": upcoming,
    "cores": List<dynamic>.from(cores.map((x) => x.toMap())),
    "id": id,
  };

  @override
  String toString() {
    return 'SpaceXLastMission{fairings: $fairings, links: $links, staticFireDateUtc: $staticFireDateUtc, staticFireDateUnix: $staticFireDateUnix, tbd: $tbd, net: $net, window: $window, rocket: $rocket, success: $success, details: $details, crew: $crew, ships: $ships, capsules: $capsules, payloads: $payloads, launchpad: $launchpad, autoUpdate: $autoUpdate, launchLibraryId: $launchLibraryId, failures: $failures, flightNumber: $flightNumber, name: $name, dateUtc: $dateUtc, dateUnix: $dateUnix, dateLocal: $dateLocal, datePrecision: $datePrecision, upcoming: $upcoming, cores: $cores, id: $id}';
  }
}

class Core {
  Core({
    required this.core,
    required this.flight,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landingAttempt,
    required this.landingSuccess,
    required this.landingType,
    required this.landpad,
  });

  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  bool landingSuccess;
  String landingType;
  String landpad;

  factory Core.fromMap(Map<String, dynamic> json) => Core(
    core: json["core"],
    flight: json["flight"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    reused: json["reused"],
    landingAttempt: json["landing_attempt"],
    landingSuccess: json["landing_success"],
    landingType: json["landing_type"],
    landpad: json["landpad"],
  );

  Map<String, dynamic> toMap() => {
    "core": core,
    "flight": flight,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "landing_attempt": landingAttempt,
    "landing_success": landingSuccess,
    "landing_type": landingType,
    "landpad": landpad,
  };

  @override
  String toString() {
    return 'Core{core: $core, flight: $flight, gridfins: $gridfins, legs: $legs, reused: $reused, landingAttempt: $landingAttempt, landingSuccess: $landingSuccess, landingType: $landingType, landpad: $landpad}';
  }
}

class Fairings {
  Fairings({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered,
    required this.ships,
  });

  bool reused;
  bool recoveryAttempt;
  bool recovered;
  List<String> ships;

  factory Fairings.fromMap(Map<String, dynamic> json) => Fairings(
    reused: json["reused"],
    recoveryAttempt: json["recovery_attempt"],
    recovered: json["recovered"],
    ships: List<String>.from(json["ships"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "reused": reused,
    "recovery_attempt": recoveryAttempt,
    "recovered": recovered,
    "ships": List<dynamic>.from(ships.map((x) => x)),
  };

  @override
  String toString() {
    return 'Fairings{reused: $reused, recoveryAttempt: $recoveryAttempt, recovered: $recovered, ships: $ships}';
  }
}

class Links {
  Links({
    required this.patch,
    required this.reddit,
    required this.flickr,
    required this.presskit,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });

  Patch patch;
  Reddit reddit;
  Flickr flickr;
  dynamic presskit;
  String webcast;
  String youtubeId;
  dynamic article;
  dynamic wikipedia;

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    patch: Patch.fromMap(json["patch"]),
    reddit: Reddit.fromMap(json["reddit"]),
    flickr: Flickr.fromMap(json["flickr"]),
    presskit: json["presskit"],
    webcast: json["webcast"],
    youtubeId: json["youtube_id"],
    article: json["article"],
    wikipedia: json["wikipedia"],
  );

  Map<String, dynamic> toMap() => {
    "patch": patch.toMap(),
    "reddit": reddit.toMap(),
    "flickr": flickr.toMap(),
    "presskit": presskit,
    "webcast": webcast,
    "youtube_id": youtubeId,
    "article": article,
    "wikipedia": wikipedia,
  };

  @override
  String toString() {
    return 'Links{patch: $patch, reddit: $reddit, flickr: $flickr, presskit: $presskit, webcast: $webcast, youtubeId: $youtubeId, article: $article, wikipedia: $wikipedia}';
  }
}

class Flickr {
  Flickr({
    required this.small,
    required this.original,
  });

  List<dynamic> small;
  List<String> original;

  factory Flickr.fromMap(Map<String, dynamic> json) => Flickr(
    small: List<dynamic>.from(json["small"].map((x) => x)),
    original: List<String>.from(json["original"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "small": List<dynamic>.from(small.map((x) => x)),
    "original": List<dynamic>.from(original.map((x) => x)),
  };

  @override
  String toString() {
    return 'Flickr{small: $small, original: $original}';
  }
}

class Patch {
  Patch({
    required this.small,
    required this.large,
  });

  String small;
  String large;

  factory Patch.fromMap(Map<String, dynamic> json) => Patch(
    small: json["small"],
    large: json["large"],
  );

  Map<String, dynamic> toMap() => {
    "small": small,
    "large": large,
  };

  @override
  String toString() {
    return 'Patch{small: $small, large: $large}';
  }
}

class Reddit {
  Reddit({
    required this.campaign,
    required this.launch,
    required this.media,
    required this.recovery,
  });

  String campaign;
  String launch;
  dynamic media;
  String recovery;

  factory Reddit.fromMap(Map<String, dynamic> json) => Reddit(
    campaign: json["campaign"],
    launch: json["launch"],
    media: json["media"],
    recovery: json["recovery"],
  );

  Map<String, dynamic> toMap() => {
    "campaign": campaign,
    "launch": launch,
    "media": media,
    "recovery": recovery,
  };

  @override
  String toString() {
    return 'Reddit{campaign: $campaign, launch: $launch, media: $media, recovery: $recovery}';
  }
}
