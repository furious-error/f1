// class DriverStandingsModel {
//     MrData mrData;

//     DriverStandingsModel({
//         required this.mrData,
//     });

// }

// class MrData {
//     String xmlns;
//     String series;
//     String url;
//     String limit;
//     String offset;
//     String total;
//     StandingsTable standingsTable;

//     MrData({
//         required this.xmlns,
//         required this.series,
//         required this.url,
//         required this.limit,
//         required this.offset,
//         required this.total,
//         required this.standingsTable,
//     });

// }

// class StandingsTable {
//     String season;
//     List<StandingsList> standingsLists;

//     StandingsTable({
//         required this.season,
//         required this.standingsLists,
//     });

// }

// class StandingsList {
//     String season;
//     String round;
//     List<DriverStanding> driverStandings;

//     StandingsList({
//         required this.season,
//         required this.round,
//         required this.driverStandings,
//     });

// }

// class DriverStanding {
//     String position;
//     String positionText;
//     String points;
//     String wins;
//     Driver driver;
//     List<Constructor> constructors;

//     DriverStanding({
//         required this.position,
//         required this.positionText,
//         required this.points,
//         required this.wins,
//         required this.driver,
//         required this.constructors,
//     });

// }

// class Constructor {
//     String constructorId;
//     String url;
//     String name;
//     String nationality;

//     Constructor({
//         required this.constructorId,
//         required this.url,
//         required this.name,
//         required this.nationality,
//     });

// }

// class Driver {
//     String driverId;
//     String permanentNumber;
//     String code;
//     String url;
//     String givenName;
//     String familyName;
//     DateTime dateOfBirth;
//     String nationality;

//     Driver({
//         required this.driverId,
//         required this.permanentNumber,
//         required this.code,
//         required this.url,
//         required this.givenName,
//         required this.familyName,
//         required this.dateOfBirth,
//         required this.nationality,
//     });

// }


class DriverStandingsModel {
  MRData? mRData;

  DriverStandingsModel({this.mRData});

  DriverStandingsModel.fromJson(Map<String, dynamic> json) {
    mRData =
        json['MRData'] != null ? MRData.fromJson(json['MRData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mRData != null) {
      data['MRData'] = mRData!.toJson();
    }
    return data;
  }
}

class MRData {
  String? xmlns;
  String? series;
  String? url;
  String? limit;
  String? offset;
  String? total;
  StandingsTable? standingsTable;

  MRData(
      {this.xmlns,
      this.series,
      this.url,
      this.limit,
      this.offset,
      this.total,
      this.standingsTable});

  MRData.fromJson(Map<String, dynamic> json) {
    xmlns = json['xmlns'];
    series = json['series'];
    url = json['url'];
    limit = json['limit'];
    offset = json['offset'];
    total = json['total'];
    standingsTable = json['StandingsTable'] != null
        ? StandingsTable.fromJson(json['StandingsTable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['xmlns'] = xmlns;
    data['series'] = series;
    data['url'] = url;
    data['limit'] = limit;
    data['offset'] = offset;
    data['total'] = total;
    if (standingsTable != null) {
      data['StandingsTable'] = standingsTable!.toJson();
    }
    return data;
  }
}

class StandingsTable {
  String? season;
  List<StandingsLists>? standingsLists;

  StandingsTable({this.season, this.standingsLists});

  StandingsTable.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    if (json['StandingsLists'] != null) {
      standingsLists = <StandingsLists>[];
      json['StandingsLists'].forEach((v) {
        standingsLists!.add(StandingsLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    if (standingsLists != null) {
      data['StandingsLists'] =
          standingsLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StandingsLists {
  String? season;
  String? round;
  List<DriverStandings>? driverStandings;

  StandingsLists({this.season, this.round, this.driverStandings});

  StandingsLists.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    if (json['DriverStandings'] != null) {
      driverStandings = <DriverStandings>[];
      json['DriverStandings'].forEach((v) {
        driverStandings!.add(DriverStandings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    data['round'] = round;
    if (driverStandings != null) {
      data['DriverStandings'] =
          driverStandings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DriverStandings {
  String? position;
  String? positionText;
  String? points;
  String? wins;
  Driver? driver;
  List<Constructors>? constructors;

  DriverStandings(
      {this.position,
      this.positionText,
      this.points,
      this.wins,
      this.driver,
      this.constructors});

  DriverStandings.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    positionText = json['positionText'];
    points = json['points'];
    wins = json['wins'];
    driver =
        json['Driver'] != null ? Driver.fromJson(json['Driver']) : null;
    if (json['Constructors'] != null) {
      constructors = <Constructors>[];
      json['Constructors'].forEach((v) {
        constructors!.add(Constructors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    data['positionText'] = positionText;
    data['points'] = points;
    data['wins'] = wins;
    if (driver != null) {
      data['Driver'] = driver!.toJson();
    }
    if (constructors != null) {
      data['Constructors'] = constructors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Driver {
  String? driverId;
  String? permanentNumber;
  String? code;
  String? url;
  String? givenName;
  String? familyName;
  String? dateOfBirth;
  String? nationality;

  Driver(
      {this.driverId,
      this.permanentNumber,
      this.code,
      this.url,
      this.givenName,
      this.familyName,
      this.dateOfBirth,
      this.nationality});

  Driver.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    permanentNumber = json['permanentNumber'];
    code = json['code'];
    url = json['url'];
    givenName = json['givenName'];
    familyName = json['familyName'];
    dateOfBirth = json['dateOfBirth'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driverId'] = driverId;
    data['permanentNumber'] = permanentNumber;
    data['code'] = code;
    data['url'] = url;
    data['givenName'] = givenName;
    data['familyName'] = familyName;
    data['dateOfBirth'] = dateOfBirth;
    data['nationality'] = nationality;
    return data;
  }
}

class Constructors {
  String? constructorId;
  String? url;
  String? name;
  String? nationality;

  Constructors({this.constructorId, this.url, this.name, this.nationality});

  Constructors.fromJson(Map<String, dynamic> json) {
    constructorId = json['constructorId'];
    url = json['url'];
    name = json['name'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['constructorId'] = constructorId;
    data['url'] = url;
    data['name'] = name;
    data['nationality'] = nationality;
    return data;
  }
}
