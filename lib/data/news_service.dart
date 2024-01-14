//getting data from API, communicate w/ server

import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/data/response/article_respone.dart';
import '../constants/constants.dart';

class NewsService {
  final client = Client();

  //get response from server after "GET"
  Future<List<ArticleResponse>> getArticles() async {
    final response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${Constants.apiKey}'));

    //check if status code in range [200, 299]
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception("API error");
    }

    //decode JSON
    final decodedData = jsonDecode(response.body);

    //get 'article' field from decoded data
    final rawArticleData = decodedData['articles'] as List;

    //return decoded data mapped into ArticleRespone model (thru ArticleResponse.fromJson method)
    return rawArticleData
        .map((oneArticle) =>
            ArticleResponse.fromJson(oneArticle as Map<String, dynamic>))
        .toList();
  }
}
