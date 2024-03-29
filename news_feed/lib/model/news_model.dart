import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class News {
  final List<Article> articles;
  News({required this.articles});
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class Article {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  @JsonKey(name: "publishedAt") final String publishDate;
  final String? content;

  Article(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishDate,
      required this.content});
  
  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
