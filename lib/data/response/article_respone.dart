//Contains the same model as article.dart
//Responsible for transfering data from API only (local role)
//But also stores methods to transfer from RAW data -> desired model

import 'package:news_app/data/response/source_respone.dart';


class ArticleResponse {
  final SourceResponse source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  ArticleResponse(
      {required this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  //method to pass JSON->model
  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      source: SourceResponse.fromJson(
        json['source'] as Map<String, dynamic>,
      ),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );
  }
}
