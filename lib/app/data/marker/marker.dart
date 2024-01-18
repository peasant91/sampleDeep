// To parse this JSON data, do
//
//     final markers = markersFromJson(jsonString);

import 'dart:convert';

Markers markersFromJson(String str) => Markers.fromJson(json.decode(str));

String markersToJson(Markers data) => json.encode(data.toJson());

class Markers {
  List<MarkerModel> markers;

  Markers({
    required this.markers,
  });

  factory Markers.fromJson(Map<String, dynamic> json) => Markers(
        markers: List<MarkerModel>.from(
            json["markers"].map((x) => MarkerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "markers": List<dynamic>.from(markers.map((x) => x.toJson())),
      };
}

class MarkerModel {
  String id;
  String title;
  String description;
  double latitude;
  double longitude;

  MarkerModel({
    required this.id,
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory MarkerModel.fromJson(Map<String, dynamic> json) => MarkerModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        latitude: json["location"]["latitude"],
        longitude: json["location"]["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
      };
}
