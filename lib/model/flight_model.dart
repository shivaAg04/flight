class flightModel {
  List<Data>? data;

  flightModel({this.data});

  flightModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? flightType;
  int? stops;
  int? totalDuration;
  List<Legs>? legs;

  Data({this.flightType, this.stops, this.totalDuration, this.legs});

  Data.fromJson(Map<String, dynamic> json) {
    flightType = json['flightType'];
    stops = json['stops'];
    totalDuration = json['totalDuration'];
    if (json['legs'] != null) {
      legs = <Legs>[];
      json['legs'].forEach((v) {
        legs!.add(new Legs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightType'] = this.flightType;
    data['stops'] = this.stops;
    data['totalDuration'] = this.totalDuration;
    if (this.legs != null) {
      data['legs'] = this.legs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Legs {
  String? origin;
  String? destination;
  String? originCity;
  String? destinationCity;
  String? originStationName;
  String? destinationStationName;
  String? estimatedDeparture;
  String? scheduledDeparture;
  String? estimatedArrival;
  String? scheduledArrival;
  String? departureTerminal;
  String? arrivalTerminal;
  String? flightIdentifier;
  int? duration;
  String? status;
  String? flightState;
  Null? overlay;

  Legs(
      {this.origin,
      this.destination,
      this.originCity,
      this.destinationCity,
      this.originStationName,
      this.destinationStationName,
      this.estimatedDeparture,
      this.scheduledDeparture,
      this.estimatedArrival,
      this.scheduledArrival,
      this.departureTerminal,
      this.arrivalTerminal,
      this.flightIdentifier,
      this.duration,
      this.status,
      this.flightState,
      this.overlay});

  Legs.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    destination = json['destination'];
    originCity = json['originCity'];
    destinationCity = json['destinationCity'];
    originStationName = json['originStationName'];
    destinationStationName = json['destinationStationName'];
    estimatedDeparture = json['estimatedDeparture'];
    scheduledDeparture = json['scheduledDeparture'];
    estimatedArrival = json['estimatedArrival'];
    scheduledArrival = json['scheduledArrival'];
    departureTerminal = json['departureTerminal'];
    arrivalTerminal = json['arrivalTerminal'];
    flightIdentifier = json['flightIdentifier'];
    duration = json['duration'];
    status = json['status'];
    flightState = json['flightState'];
    overlay = json['overlay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['origin'] = this.origin;
    data['destination'] = this.destination;
    data['originCity'] = this.originCity;
    data['destinationCity'] = this.destinationCity;
    data['originStationName'] = this.originStationName;
    data['destinationStationName'] = this.destinationStationName;
    data['estimatedDeparture'] = this.estimatedDeparture;
    data['scheduledDeparture'] = this.scheduledDeparture;
    data['estimatedArrival'] = this.estimatedArrival;
    data['scheduledArrival'] = this.scheduledArrival;
    data['departureTerminal'] = this.departureTerminal;
    data['arrivalTerminal'] = this.arrivalTerminal;
    data['flightIdentifier'] = this.flightIdentifier;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['flightState'] = this.flightState;
    data['overlay'] = this.overlay;
    return data;
  }
}
