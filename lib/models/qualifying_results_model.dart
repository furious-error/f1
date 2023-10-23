class QualifyingResultModel {
  MRData? mRData;

  QualifyingResultModel({this.mRData});

  QualifyingResultModel.fromJson(Map<String, dynamic> json) {
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
  RaceTable? raceTable;

  MRData(
      {this.xmlns,
      this.series,
      this.url,
      this.limit,
      this.offset,
      this.total,
      this.raceTable});

  MRData.fromJson(Map<String, dynamic> json) {
    xmlns = json['xmlns'];
    series = json['series'];
    url = json['url'];
    limit = json['limit'];
    offset = json['offset'];
    total = json['total'];
    raceTable = json['RaceTable'] != null
        ? RaceTable.fromJson(json['RaceTable'])
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
    if (raceTable != null) {
      data['RaceTable'] = raceTable!.toJson();
    }
    return data;
  }
}

class RaceTable {
  String? season;
  String? round;
  List<Races>? races;

  RaceTable({this.season, this.round, this.races});

  RaceTable.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    if (json['Races'] != null) {
      races = <Races>[];
      json['Races'].forEach((v) {
        races!.add(Races.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    data['round'] = round;
    if (races != null) {
      data['Races'] = races!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Races {
  String? season;
  String? round;
  String? url;
  String? raceName;
  Circuit? circuit;
  String? date;
  String? time;
  List<QualifyingResults>? qualifyingResults;

  Races(
      {this.season,
      this.round,
      this.url,
      this.raceName,
      this.circuit,
      this.date,
      this.time,
      this.qualifyingResults});

  Races.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    url = json['url'];
    raceName = json['raceName'];
    circuit =
        json['Circuit'] != null ? Circuit.fromJson(json['Circuit']) : null;
    date = json['date'];
    time = json['time'];
    if (json['QualifyingResults'] != null) {
      qualifyingResults = <QualifyingResults>[];
      json['QualifyingResults'].forEach((v) {
        qualifyingResults!.add(QualifyingResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    data['round'] = round;
    data['url'] = url;
    data['raceName'] = raceName;
    if (circuit != null) {
      data['Circuit'] = circuit!.toJson();
    }
    data['date'] = date;
    data['time'] = time;
    if (qualifyingResults != null) {
      data['QualifyingResults'] =
          qualifyingResults!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Circuit {
  String? circuitId;
  String? url;
  String? circuitName;
  Location? location;

  Circuit({this.circuitId, this.url, this.circuitName, this.location});

  Circuit.fromJson(Map<String, dynamic> json) {
    circuitId = json['circuitId'];
    url = json['url'];
    circuitName = json['circuitName'];
    location = json['Location'] != null
        ? Location.fromJson(json['Location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['circuitId'] = circuitId;
    data['url'] = url;
    data['circuitName'] = circuitName;
    if (location != null) {
      data['Location'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  String? lat;
  String? long;
  String? locality;
  String? country;

  Location({this.lat, this.long, this.locality, this.country});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    locality = json['locality'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['locality'] = locality;
    data['country'] = country;
    return data;
  }
}

class QualifyingResults {
  String? number;
  String? position;
  Driver? driver;
  Constructor? constructor;
  String? q1;
  String? q2;
  String? q3;

  QualifyingResults(
      {this.number,
      this.position,
      this.driver,
      this.constructor,
      this.q1,
      this.q2,
      this.q3});

  QualifyingResults.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    position = json['position'];
    driver =
        json['Driver'] != null ? Driver.fromJson(json['Driver']) : null;
    constructor = json['Constructor'] != null
        ? Constructor.fromJson(json['Constructor'])
        : null;
    q1 = json['Q1'];
    q2 = json['Q2'];
    q3 = json['Q3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['position'] = position;
    if (driver != null) {
      data['Driver'] = driver!.toJson();
    }
    if (constructor != null) {
      data['Constructor'] = constructor!.toJson();
    }
    data['Q1'] = q1;
    data['Q2'] = q2;
    data['Q3'] = q3;
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
