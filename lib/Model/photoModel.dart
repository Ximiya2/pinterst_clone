// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

List<PhotoModel> photoModelFromJson(String str) => List<PhotoModel>.from(json.decode(str).map((x) => PhotoModel.fromJson(x)));

String photoModelToJson(List<PhotoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoModel {
  PhotoModel({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.pending,
    required this.approved,
    required this.rejected,
    this.subId,
    required this.createdAt,
    required this.originalFilename,
    this.breedIds,
  });

  List<dynamic> breeds;
  String id;
  String url;
  int width;
  int height;
  int pending;
  int approved;
  int rejected;
  String? subId;
  DateTime createdAt;
  String originalFilename;
  String? breedIds;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    breeds: List<dynamic>.from(json["breeds"].map((x) => x)),
    id: json["id"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
    pending: json["pending"],
    approved: json["approved"],
    rejected: json["rejected"],
    subId: json["sub_id"],
    createdAt: DateTime.parse(json["created_at"]),
    originalFilename: json["original_filename"],
    breedIds: json["breed_ids"],
  );

  Map<String, dynamic> toJson() => {
    "breeds": List<dynamic>.from(breeds.map((x) => x)),
    "id": id,
    "url": url,
    "width": width,
    "height": height,
    "pending": pending,
    "approved": approved,
    "rejected": rejected,
    "sub_id": subId,
    "created_at": createdAt.toIso8601String(),
    "original_filename": originalFilename,
    "breed_ids": breedIds,
  };
}
