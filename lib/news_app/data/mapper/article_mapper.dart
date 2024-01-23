//mapping ArticleResponse to Article

import '../../model/article.dart';
import '../../model/source.dart';
import '../response/article_respone.dart';
import '../response/source_respone.dart';

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
