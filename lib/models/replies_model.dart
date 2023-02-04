// To parse this JSON data, do
//
//     final repliesApi = repliesApiFromJson(jsonString);

import 'dart:convert';

RepliesApi repliesApiFromJson(String str) =>
    RepliesApi.fromJson(json.decode(str));

String repliesApiToJson(RepliesApi data) => json.encode(data.toJson());

class RepliesApi {
  RepliesApi({
    required this.replies,
    required this.continuationToken,
  });

  List<Reply> replies;
  String continuationToken;

  factory RepliesApi.fromJson(Map<String, dynamic> json) => RepliesApi(
        replies:
            List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
        continuationToken: json["continuation_token"],
      );

  Map<String, dynamic> toJson() => {
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "continuation_token": continuationToken,
      };
}

class Reply {
  Reply({
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
    required this.views,
    this.timestamp,
    this.videoViewCount,
  });

  String tweetId;
  String creationDate;
  String text;
  List<String>? mediaUrl;
  dynamic videoUrl;
  User user;
  String language;
  int favoriteCount;
  int retweetCount;
  int replyCount;
  int quoteCount;
  bool retweet;
  int views;
  dynamic timestamp;
  dynamic videoViewCount;

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        tweetId: json["tweet_id"],
        creationDate: json["creation_date"],
        text: json["text"],
        mediaUrl: json["media_url"] == null
            ? []
            : List<String>.from(json["media_url"]!.map((x) => x)),
        videoUrl: json["video_url"],
        user: User.fromJson(json["user"]),
        language: json["language"],
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

enum Language { EN, QME }

final languageValues = EnumValues({"en": Language.EN, "qme": Language.QME});

class User {
  User({
    required this.creationDate,
    required this.userId,
    required this.username,
    required this.name,
    required this.followerCount,
    required this.followingCount,
    required this.favouritesCount,
    required this.isPrivate,
    required this.isVerified,
    required this.location,
    required this.profilePicUrl,
    this.profileBannerUrl,
    required this.description,
    this.externalUrl,
    required this.numberOfTweets,
    required this.bot,
    required this.timestamp,
    required this.hasNftAvatar,
  });

  String creationDate;
  String userId;
  String username;
  String name;
  int followerCount;
  int followingCount;
  int favouritesCount;
  bool isPrivate;
  bool isVerified;
  String location;
  String profilePicUrl;
  String? profileBannerUrl;
  String description;
  String? externalUrl;
  int numberOfTweets;
  bool bot;
  int timestamp;
  bool hasNftAvatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        creationDate: json["creation_date"],
        userId: json["user_id"],
        username: json["username"],
        name: json["name"],
        followerCount: json["follower_count"],
        followingCount: json["following_count"],
        favouritesCount: json["favourites_count"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        location: json["location"],
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
        "creation_date": creationDate,
        "user_id": userId,
        "username": username,
        "name": name,
        "follower_count": followerCount,
        "following_count": followingCount,
        "favourites_count": favouritesCount,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "location": location,
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
