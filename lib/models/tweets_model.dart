// To parse this JSON data, do
//
//     final tweetsApi = tweetsApiFromJson(jsonString);

import 'dart:convert';

TweetsApi tweetsApiFromJson(String str) => TweetsApi.fromJson(json.decode(str));

String tweetsApiToJson(TweetsApi data) => json.encode(data.toJson());

class TweetsApi {
  TweetsApi({
    required this.results,
    required this.continuationToken,
  });

  List<Result> results;
  String continuationToken;

  factory TweetsApi.fromJson(Map<String, dynamic> json) => TweetsApi(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        continuationToken: json["continuation_token"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "continuation_token": continuationToken,
      };
}

class Result {
  Result({
    required this.tweetId,
    required this.creationDate,
    required this.text,
    this.mediaUrl,
    this.videoUrl,
    required this.user,
    required this.language,
    required this.favoriteCount,
    required this.retweetCount,
    required this.replyCount,
    required this.quoteCount,
    required this.retweet,
    this.views,
    required this.timestamp,
    this.videoViewCount,
  });

  String tweetId;
  String creationDate;
  String text;
  List<String>? mediaUrl;
  dynamic videoUrl;
  User user;
  Language language;
  int favoriteCount;
  int retweetCount;
  int replyCount;
  int quoteCount;
  bool retweet;
  int? views;
  int timestamp;
  int? videoViewCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tweetId: json["tweet_id"],
        creationDate: json["creation_date"],
        text: json["text"],
        mediaUrl: json["media_url"] == null
            ? []
            : List<String>.from(json["media_url"]!.map((x) => x)),
        videoUrl: json["video_url"],
        user: User.fromJson(json["user"]),
        language: languageValues.map[json["language"]]!,
        favoriteCount: json["favorite_count"],
        retweetCount: json["retweet_count"],
        replyCount: json["reply_count"],
        quoteCount: json["quote_count"],
        retweet: json["retweet"],
        views: json["views"],
        timestamp: json["timestamp"],
        videoViewCount: json["video_view_count"],
      );

  Map<String, dynamic> toJson() => {
        "tweet_id": tweetId,
        "creation_date": creationDate,
        "text": text,
        "media_url":
            mediaUrl == null ? [] : List<dynamic>.from(mediaUrl!.map((x) => x)),
        "video_url": videoUrl,
        "user": user.toJson(),
        "language": languageValues.reverse[language],
        "favorite_count": favoriteCount,
        "retweet_count": retweetCount,
        "reply_count": replyCount,
        "quote_count": quoteCount,
        "retweet": retweet,
        "views": views,
        "timestamp": timestamp,
        "video_view_count": videoViewCount,
      };
}

enum Language { EN, FR, ZXX, IN }

final languageValues = EnumValues({
  "en": Language.EN,
  "fr": Language.FR,
  "in": Language.IN,
  "zxx": Language.ZXX
});

class User {
  User({
    required this.creationDate,
    this.userId,
    required this.username,
    required this.name,
    required this.followerCount,
    required this.followingCount,
    this.favouritesCount,
    required this.isPrivate,
    required this.isVerified,
    required this.location,
    required this.profilePicUrl,
    this.profileBannerUrl,
    required this.description,
    required this.externalUrl,
    required this.numberOfTweets,
    required this.bot,
    this.timestamp,
    required this.hasNftAvatar,
  });

  CreationDate creationDate;
  String? userId;
  String username;
  String name;
  int followerCount;
  int followingCount;
  int? favouritesCount;
  bool isPrivate;
  bool isVerified;
  Location location;
  String profilePicUrl;
  String? profileBannerUrl;
  String description;
  String externalUrl;
  int numberOfTweets;
  bool bot;
  int? timestamp;
  bool hasNftAvatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        creationDate: creationDateValues.map[json["creation_date"]]!,
        userId: json["user_id"],
        username: json["username"],
        name: json["name"],
        followerCount: json["follower_count"],
        followingCount: json["following_count"],
        favouritesCount: json["favourites_count"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        location: locationValues.map[json["location"]]!,
        profilePicUrl: json["profile_pic_url"],
        profileBannerUrl: json["profile_banner_url"],
        description: json["description"],
        externalUrl: json["external_url"],
        numberOfTweets: json["number_of_tweets"],
        bot: json["bot"],
        timestamp: json["timestamp"],
        hasNftAvatar: json["has_nft_avatar"],
      );

  Map<String, dynamic> toJson() => {
        "creation_date": creationDateValues.reverse[creationDate],
        "user_id": userId,
        "username": username,
        "name": name,
        "follower_count": followerCount,
        "following_count": followingCount,
        "favourites_count": favouritesCount,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "location": locationValues.reverse[location],
        "profile_pic_url": profilePicUrl,
        "profile_banner_url": profileBannerUrl,
        "description": description,
        "external_url": externalUrl,
        "number_of_tweets": numberOfTweets,
        "bot": bot,
        "timestamp": timestamp,
        "has_nft_avatar": hasNftAvatar,
      };
}

enum CreationDate { FRI_MAY_1610412000002014, THU_SEP_2906593700002011 }

final creationDateValues = EnumValues({
  "Fri May 16 10:41:20 +0000 2014": CreationDate.FRI_MAY_1610412000002014,
  "Thu Sep 29 06:59:37 +0000 2011": CreationDate.THU_SEP_2906593700002011
});

enum Location { FOR_PARTNERSHIP_DM_11_CALL, DELHI_HIMACHAL_INDIA }

final locationValues = EnumValues({
  "Delhi/Himachal/India": Location.DELHI_HIMACHAL_INDIA,
  "For Partnership - DM /1:1 Call": Location.FOR_PARTNERSHIP_DM_11_CALL
});

enum Name { RAVISUTANJANI, ANURAG_THAKUR }

final nameValues = EnumValues(
    {"Anurag Thakur": Name.ANURAG_THAKUR, "Ravisutanjani": Name.RAVISUTANJANI});

enum Username { RAVISUTANJANI, IANURAGTHAKUR }

final usernameValues = EnumValues({
  "ianuragthakur": Username.IANURAGTHAKUR,
  "Ravisutanjani": Username.RAVISUTANJANI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
