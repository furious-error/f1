class ConstructorStandingsModel {
  MRData? mRData;

  ConstructorStandingsModel({this.mRData});

  ConstructorStandingsModel.fromJson(Map<String, dynamic> json) {
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
  List<ConstructorStandings>? constructorStandings;

  StandingsLists({this.season, this.round, this.constructorStandings});

  StandingsLists.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    if (json['ConstructorStandings'] != null) {
      constructorStandings = <ConstructorStandings>[];
      json['ConstructorStandings'].forEach((v) {
        constructorStandings!.add(ConstructorStandings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    data['round'] = round;
    if (constructorStandings != null) {
      data['ConstructorStandings'] =
          constructorStandings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConstructorStandings {
  String? position;
  String? positionText;
  String? points;
  String? wins;
  Constructor? constructor;

  ConstructorStandings(
      {this.position,
      this.positionText,
      this.points,
      this.wins,
      this.constructor});

  ConstructorStandings.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    positionText = json['positionText'];
    points = json['points'];
    wins = json['wins'];
    constructor = json['Constructor'] != null
        ? Constructor.fromJson(json['Constructor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    data['positionText'] = positionText;
    data['points'] = points;
    data['wins'] = wins;
    if (constructor != null) {
      data['Constructor'] = constructor!.toJson();
    }
    return data;
  }
}

class Constructor {
  String? constructorId;
  String? url;
  String? name;
  String? nationality;

  Constructor({this.constructorId, this.url, this.name, this.nationality});

  Constructor.fromJson(Map<String, dynamic> json) {
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
