// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'photoModel.g.dart';

List<PhotoModel> photoModelFromJson(String str) => List<PhotoModel>.from(json.decode(str).map((x) => PhotoModel.fromJson(x)));

String photoModelToJson(List<PhotoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class PhotoModel {
  PhotoModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
  });

  @HiveField(1)
  String? id;
  @HiveField(2)
  DateTime? createdAt;
  @HiveField(3)
  DateTime? updatedAt;
  @HiveField(4)
  DateTime? promotedAt;
  @HiveField(5)
  int? width;
  @HiveField(6)
  int? height;
  @HiveField(7)
  String? color;
  @HiveField(8)
  String? blurHash;
  @HiveField(9)
  String? description;
  @HiveField(10)
  String? altDescription;
  @HiveField(11)
  Urls? urls;
  @HiveField(12)
  PhotoModelLinks? links;
  @HiveField(13)
  int? likes;
  @HiveField(14)
  bool? likedByUser;
  @HiveField(15)
  List<dynamic>? currentUserCollections;
  @HiveField(16)
  dynamic sponsorship;
  @HiveField(17)
  TopicSubmissions? topicSubmissions;
  @HiveField(18)
  User? user;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
    links: json["links"] == null ? null : PhotoModelLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: json["topic_submissions"] == null ? null : TopicSubmissions.fromJson(json["topic_submissions"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "urls": urls?.toJson(),
    "links": links?.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions?.toJson(),
    "user": user?.toJson(),
  };
}

@HiveType(typeId: 2)
class PhotoModelLinks {
  PhotoModelLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  @HiveField(1)
  String? self;
  @HiveField(2)
  String? html;
  @HiveField(3)
  String? download;
  @HiveField(4)
  String? downloadLocation;

  factory PhotoModelLinks.fromJson(Map<String, dynamic> json) => PhotoModelLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

@HiveType(typeId: 3)
class TopicSubmissions {
  TopicSubmissions({
    this.travel,
    this.people,
    this.health,
  });

  @HiveField(1)
  Health? travel;
  @HiveField(2)
  Health? people;
  @HiveField(3)
  Health? health;

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
    travel: json["travel"] == null ? null : Health.fromJson(json["travel"]),
    people: json["people"] == null ? null : Health.fromJson(json["people"]),
    health: json["health"] == null ? null : Health.fromJson(json["health"]),
  );

  Map<String, dynamic> toJson() => {
    "travel": travel?.toJson(),
    "people": people?.toJson(),
    "health": health?.toJson(),
  };
}

@HiveType(typeId: 4)
class Health {
  Health({
    this.status,
  });

  @HiveField(1)
  String? status;

  factory Health.fromJson(Map<String, dynamic> json) => Health(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

@HiveType(typeId: 5)
class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  @HiveField(1)
  String? raw;
  @HiveField(2)
  String? full;
  @HiveField(3)
  String? regular;
  @HiveField(4)
  String? small;
  @HiveField(5)
  String? thumb;
  @HiveField(6)
  String? smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}

@HiveType(typeId: 6)
class User {
  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  @HiveField(1)
  String? id;
  @HiveField(2)
  DateTime? updatedAt;
  @HiveField(3)
  String? username;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? firstName;
  @HiveField(6)
  String? lastName;
  @HiveField(7)
  String? twitterUsername;
  @HiveField(8)
  String? portfolioUrl;
  @HiveField(9)
  String? bio;
  @HiveField(10)
  String? location;
  @HiveField(11)
  UserLinks? links;
  @HiveField(12)
  ProfileImage? profileImage;
  @HiveField(13)
  String? instagramUsername;
  @HiveField(14)
  int? totalCollections;
  @HiveField(15)
  int? totalLikes;
  @HiveField(16)
  int? totalPhotos;
  @HiveField(17)
  bool? acceptedTos;
  @HiveField(18)
  bool? forHire;
  @HiveField(19)
  Social? social;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
    profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: json["social"] == null ? null : Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links?.toJson(),
    "profile_image": profileImage?.toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social?.toJson(),
  };
}

@HiveType(typeId: 7)
class UserLinks {
  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  @HiveField(1)
  String? self;
  @HiveField(2)
  String? html;
  @HiveField(3)
  String? photos;
  @HiveField(4)
  String? likes;
  @HiveField(5)
  String? portfolio;
  @HiveField(6)
  String? following;
  @HiveField(7)
  String? followers;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

@HiveType(typeId: 8)
class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  @HiveField(1)
  String? small;
  @HiveField(2)
  String? medium;
  @HiveField(3)
  String? large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

@HiveType(typeId: 9)
class Social {
  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  @HiveField(1)
  String? instagramUsername;
  @HiveField(2)
  String? portfolioUrl;
  @HiveField(3)
  String? twitterUsername;
  @HiveField(4)
  dynamic paypalEmail;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    instagramUsername: json["instagram_username"],
    portfolioUrl: json["portfolio_url"],
    twitterUsername: json["twitter_username"],
    paypalEmail: json["paypal_email"],
  );

  Map<String, dynamic> toJson() => {
    "instagram_username": instagramUsername,
    "portfolio_url": portfolioUrl,
    "twitter_username": twitterUsername,
    "paypal_email": paypalEmail,
  };
}
