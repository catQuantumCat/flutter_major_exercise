//mapping ArticleResponse to Article

import 'package:news_app/data/response/article_respone.dart';
import 'package:news_app/data/response/source_respone.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/source.dart';

Article toArticle(ArticleResponse articleResponse) {
  return Article(
    source: toSource(articleResponse.source),
    author: articleResponse.author,
    title: articleResponse.title,
    description: articleResponse.description,
    url: articleResponse.url,
    urlToImage: articleResponse.urlToImage,
    publishedAt: articleResponse.publishedAt,
    content: articleResponse.content,
  );
}

Source toSource(SourceResponse sourceResponse) {
  return Source(id: sourceResponse.id, name: sourceResponse.name);
}
