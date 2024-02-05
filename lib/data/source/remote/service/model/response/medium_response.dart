import 'package:json_annotation/json_annotation.dart';

part 'medium_response.g.dart';

@JsonSerializable()
class MediumResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "feed")
  final FeedResponse? feed;
  @JsonKey(name: "items")
  final List<StoryResponse>? items;

  MediumResponse({
    this.status,
    this.feed,
    this.items,
  });

  factory MediumResponse.fromJson(Map<String, dynamic>? json) =>
      json == null ? MediumResponse() : _$MediumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MediumResponseToJson(this);
}

@JsonSerializable()
class FeedResponse {
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "link")
  final String? link;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;

  FeedResponse({
    this.url,
    this.title,
    this.link,
    this.author,
    this.description,
    this.image,
  });

  factory FeedResponse.fromJson(Map<String, dynamic>? json) =>
      json == null ? FeedResponse() : _$FeedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedResponseToJson(this);
}

@JsonSerializable()
class StoryResponse {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "pubDate")
  final String? pubDate;
  @JsonKey(name: "link")
  final String? link;
  @JsonKey(name: "guid")
  final String? guid;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "thumbnail")
  final String? thumbnail;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "categories")
  final List<String>? categories;

  StoryResponse({
    this.title,
    this.pubDate,
    this.link,
    this.guid,
    this.author,
    this.thumbnail,
    this.description,
    this.categories,
  });

  factory StoryResponse.fromJson(Map<String, dynamic>? json) =>
      json == null ? StoryResponse() : _$StoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoryResponseToJson(this);
}
