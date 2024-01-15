import '../data/mapper/article_mapper.dart';
import '../data/news_service.dart';
import '../model/article.dart';

class NewsRepository {
  final newsService = NewsService();

  Future<List<Article>> getArticles({required String country}) async {
    final article = await newsService.getArticles(country);

    return article.map(toArticle).toList();
  }
}
