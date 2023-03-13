// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

List<PhotoModel> photoModelFromJson(String str) => List<PhotoModel>.from(json.decode(str).map((x) => PhotoModel.fromJson(x)));

String photoModelToJson(List<PhotoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoModel {
  PhotoModel({
    required this.id,
    this.title,
    this.description,
    this.publishedAt,
    this.lastCollectedAt,
    required this.updatedAt,
    this.curated,
    this.featured,
    this.totalPhotos,
    this.private,
    this.shareKey,
    this.tags,
    required this.links,
    required this.user,
    this.coverPhoto,
    this.previewPhotos,
    this.createdAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.altDescription,
    this.urls,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
  });

  String id;
  String? title;
  String? description;
  DateTime? publishedAt;
  DateTime? lastCollectedAt;
  DateTime updatedAt;
  bool? curated;
  bool? featured;
  int? totalPhotos;
  bool? private;
  String? shareKey;
  List<Tag>? tags;
  PhotoModelLinks links;
  User user;
  PhotoModelCoverPhoto? coverPhoto;
  List<PreviewPhoto>? previewPhotos;
  DateTime? createdAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? altDescription;
  Urls? urls;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  Sponsorship? sponsorship;
  PhotoModelTopicSubmissions? topicSubmissions;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
    lastCollectedAt: json["last_collected_at"] == null ? null : DateTime.parse(json["last_collected_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    curated: json["curated"],
    featured: json["featured"],
    totalPhotos: json["total_photos"],
    private: json["private"],
    shareKey: json["share_key"],
    tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    links: PhotoModelLinks.fromJson(json["links"]),
    user: User.fromJson(json["user"]),
    coverPhoto: json["cover_photo"] == null ? null : PhotoModelCoverPhoto.fromJson(json["cover_photo"]),
    previewPhotos: json["preview_photos"] == null ? [] : List<PreviewPhoto>.from(json["preview_photos"]!.map((x) => PreviewPhoto.fromJson(x))),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    altDescription: json["alt_description"],
    urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
    sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
    topicSubmissions: json["topic_submissions"] == null ? null : PhotoModelTopicSubmissions.fromJson(json["topic_submissions"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "published_at": publishedAt?.toIso8601String(),
    "last_collected_at": lastCollectedAt?.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "curated": curated,
    "featured": featured,
    "total_photos": totalPhotos,
    "private": private,
    "share_key": shareKey,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "links": links.toJson(),
    "user": user.toJson(),
    "cover_photo": coverPhoto?.toJson(),
    "preview_photos": previewPhotos == null ? [] : List<dynamic>.from(previewPhotos!.map((x) => x.toJson())),
    "created_at": createdAt?.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "alt_description": altDescription,
    "urls": urls?.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
    "sponsorship": sponsorship?.toJson(),
    "topic_submissions": topicSubmissions?.toJson(),
  };
}

class PhotoModelCoverPhoto {
  PhotoModelCoverPhoto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    required this.user,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  Urls urls;
  CoverPhotoLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  PurpleTopicSubmissions topicSubmissions;
  User user;

  factory PhotoModelCoverPhoto.fromJson(Map<String, dynamic> json) => PhotoModelCoverPhoto(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromJson(json["urls"]),
    links: CoverPhotoLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: PurpleTopicSubmissions.fromJson(json["topic_submissions"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "urls": urls.toJson(),
    "links": links.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions.toJson(),
    "user": user.toJson(),
  };
}

class CoverPhotoLinks {
  CoverPhotoLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  String self;
  String html;
  String download;
  String downloadLocation;

  factory CoverPhotoLinks.fromJson(Map<String, dynamic> json) => CoverPhotoLinks(
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

class PurpleTopicSubmissions {
  PurpleTopicSubmissions({
    this.artsCulture,
    this.the3DRenders,
    this.architectureInterior,
    this.interiors,
  });

  The3DRenders? artsCulture;
  ArchitectureInterior? the3DRenders;
  The3DRenders? architectureInterior;
  The3DRenders? interiors;

  factory PurpleTopicSubmissions.fromJson(Map<String, dynamic> json) => PurpleTopicSubmissions(
    artsCulture: json["arts-culture"] == null ? null : The3DRenders.fromJson(json["arts-culture"]),
    the3DRenders: json["3d-renders"] == null ? null : ArchitectureInterior.fromJson(json["3d-renders"]),
    architectureInterior: json["architecture-interior"] == null ? null : The3DRenders.fromJson(json["architecture-interior"]),
    interiors: json["interiors"] == null ? null : The3DRenders.fromJson(json["interiors"]),
  );

  Map<String, dynamic> toJson() => {
    "arts-culture": artsCulture?.toJson(),
    "3d-renders": the3DRenders?.toJson(),
    "architecture-interior": architectureInterior?.toJson(),
    "interiors": interiors?.toJson(),
  };
}

class The3DRenders {
  The3DRenders({
    required this.status,
    required this.approvedOn,
  });

  Status status;
  DateTime approvedOn;

  factory The3DRenders.fromJson(Map<String, dynamic> json) => The3DRenders(
    status: statusValues.map[json["status"]]!,
    approvedOn: DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
    "approved_on": approvedOn.toIso8601String(),
  };
}

enum Status { APPROVED }

final statusValues = EnumValues({
  "approved": Status.APPROVED
});

class ArchitectureInterior {
  ArchitectureInterior({
    required this.status,
  });

  String status;

  factory ArchitectureInterior.fromJson(Map<String, dynamic> json) => ArchitectureInterior(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

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

class User {
  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    required this.links,
    required this.profileImage,
    this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks links;
  ProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;
  bool forHire;
  Social social;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: UserLinks.fromJson(json["links"]),
    profileImage: ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links.toJson(),
    "profile_image": profileImage.toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social.toJson(),
  };
}

class UserLinks {
  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

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

class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  String small;
  String medium;
  String large;

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

class Social {
  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
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

class PhotoModelLinks {
  PhotoModelLinks({
    required this.self,
    required this.html,
    this.photos,
    this.related,
    this.download,
    this.downloadLocation,
  });

  String self;
  String html;
  String? photos;
  String? related;
  String? download;
  String? downloadLocation;

  factory PhotoModelLinks.fromJson(Map<String, dynamic> json) => PhotoModelLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    related: json["related"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "related": related,
    "download": download,
    "download_location": downloadLocation,
  };
}

class PreviewPhoto {
  PreviewPhoto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.blurHash,
    required this.urls,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String blurHash;
  Urls urls;

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    blurHash: json["blur_hash"],
    urls: Urls.fromJson(json["urls"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "blur_hash": blurHash,
    "urls": urls.toJson(),
  };
}

class Sponsorship {
  Sponsorship({
    required this.impressionUrls,
    required this.tagline,
    required this.taglineUrl,
    required this.sponsor,
  });

  List<dynamic> impressionUrls;
  String tagline;
  String taglineUrl;
  User sponsor;

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
    impressionUrls: List<dynamic>.from(json["impression_urls"].map((x) => x)),
    tagline: json["tagline"],
    taglineUrl: json["tagline_url"],
    sponsor: User.fromJson(json["sponsor"]),
  );

  Map<String, dynamic> toJson() => {
    "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
    "tagline": tagline,
    "tagline_url": taglineUrl,
    "sponsor": sponsor.toJson(),
  };
}

class Tag {
  Tag({
    required this.type,
    required this.title,
    this.source,
  });

  TypeEnum type;
  String title;
  Source? source;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    type: typeEnumValues.map[json["type"]]!,
    title: json["title"],
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "type": typeEnumValues.reverse[type],
    "title": title,
    "source": source?.toJson(),
  };
}

class Source {
  Source({
    required this.ancestry,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.coverPhoto,
  });

  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  SourceCoverPhoto coverPhoto;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    ancestry: Ancestry.fromJson(json["ancestry"]),
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    coverPhoto: SourceCoverPhoto.fromJson(json["cover_photo"]),
  );

  Map<String, dynamic> toJson() => {
    "ancestry": ancestry.toJson(),
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "cover_photo": coverPhoto.toJson(),
  };
}

class Ancestry {
  Ancestry({
    required this.type,
    this.category,
    this.subcategory,
  });

  TypeClass type;
  TypeClass? category;
  TypeClass? subcategory;

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
    type: TypeClass.fromJson(json["type"]),
    category: json["category"] == null ? null : TypeClass.fromJson(json["category"]),
    subcategory: json["subcategory"] == null ? null : TypeClass.fromJson(json["subcategory"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type.toJson(),
    "category": category?.toJson(),
    "subcategory": subcategory?.toJson(),
  };
}

class TypeClass {
  TypeClass({
    required this.slug,
    required this.prettySlug,
  });

  String slug;
  String prettySlug;

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
    slug: json["slug"],
    prettySlug: json["pretty_slug"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "pretty_slug": prettySlug,
  };
}

class SourceCoverPhoto {
  SourceCoverPhoto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    this.premium,
    required this.user,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String? altDescription;
  Urls urls;
  CoverPhotoLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  FluffyTopicSubmissions topicSubmissions;
  bool? premium;
  User user;

  factory SourceCoverPhoto.fromJson(Map<String, dynamic> json) => SourceCoverPhoto(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromJson(json["urls"]),
    links: CoverPhotoLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: FluffyTopicSubmissions.fromJson(json["topic_submissions"]),
    premium: json["premium"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "urls": urls.toJson(),
    "links": links.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions.toJson(),
    "premium": premium,
    "user": user.toJson(),
  };
}

class FluffyTopicSubmissions {
  FluffyTopicSubmissions({
    this.athletics,
    this.health,
    this.people,
    this.nature,
    this.wallpapers,
    this.architectureInterior,
    this.colorOfWater,
    this.texturesPatterns,
    this.currentEvents,
    this.spirituality,
    this.artsCulture,
  });

  The3DRenders? athletics;
  The3DRenders? health;
  The3DRenders? people;
  The3DRenders? nature;
  The3DRenders? wallpapers;
  The3DRenders? architectureInterior;
  The3DRenders? colorOfWater;
  The3DRenders? texturesPatterns;
  The3DRenders? currentEvents;
  The3DRenders? spirituality;
  The3DRenders? artsCulture;

  factory FluffyTopicSubmissions.fromJson(Map<String, dynamic> json) => FluffyTopicSubmissions(
    athletics: json["athletics"] == null ? null : The3DRenders.fromJson(json["athletics"]),
    health: json["health"] == null ? null : The3DRenders.fromJson(json["health"]),
    people: json["people"] == null ? null : The3DRenders.fromJson(json["people"]),
    nature: json["nature"] == null ? null : The3DRenders.fromJson(json["nature"]),
    wallpapers: json["wallpapers"] == null ? null : The3DRenders.fromJson(json["wallpapers"]),
    architectureInterior: json["architecture-interior"] == null ? null : The3DRenders.fromJson(json["architecture-interior"]),
    colorOfWater: json["color-of-water"] == null ? null : The3DRenders.fromJson(json["color-of-water"]),
    texturesPatterns: json["textures-patterns"] == null ? null : The3DRenders.fromJson(json["textures-patterns"]),
    currentEvents: json["current-events"] == null ? null : The3DRenders.fromJson(json["current-events"]),
    spirituality: json["spirituality"] == null ? null : The3DRenders.fromJson(json["spirituality"]),
    artsCulture: json["arts-culture"] == null ? null : The3DRenders.fromJson(json["arts-culture"]),
  );

  Map<String, dynamic> toJson() => {
    "athletics": athletics?.toJson(),
    "health": health?.toJson(),
    "people": people?.toJson(),
    "nature": nature?.toJson(),
    "wallpapers": wallpapers?.toJson(),
    "architecture-interior": architectureInterior?.toJson(),
    "color-of-water": colorOfWater?.toJson(),
    "textures-patterns": texturesPatterns?.toJson(),
    "current-events": currentEvents?.toJson(),
    "spirituality": spirituality?.toJson(),
    "arts-culture": artsCulture?.toJson(),
  };
}

enum TypeEnum { LANDING_PAGE, SEARCH }

final typeEnumValues = EnumValues({
  "landing_page": TypeEnum.LANDING_PAGE,
  "search": TypeEnum.SEARCH
});

class PhotoModelTopicSubmissions {
  PhotoModelTopicSubmissions({
    this.the3DRenders,
    this.wallpapers,
    this.architectureInterior,
  });

  The3DRenders? the3DRenders;
  ArchitectureInterior? wallpapers;
  ArchitectureInterior? architectureInterior;

  factory PhotoModelTopicSubmissions.fromJson(Map<String, dynamic> json) => PhotoModelTopicSubmissions(
    the3DRenders: json["3d-renders"] == null ? null : The3DRenders.fromJson(json["3d-renders"]),
    wallpapers: json["wallpapers"] == null ? null : ArchitectureInterior.fromJson(json["wallpapers"]),
    architectureInterior: json["architecture-interior"] == null ? null : ArchitectureInterior.fromJson(json["architecture-interior"]),
  );

  Map<String, dynamic> toJson() => {
    "3d-renders": the3DRenders?.toJson(),
    "wallpapers": wallpapers?.toJson(),
    "architecture-interior": architectureInterior?.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
