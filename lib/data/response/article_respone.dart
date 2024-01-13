//Contains the same model as article.dart
//Responsible for transfering data from API only (local role)
//But also stores methods to transfer from RAW data -> desired model

import '../../model/source.dart';

class ArticleResponse {
  final Source source;
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
}
