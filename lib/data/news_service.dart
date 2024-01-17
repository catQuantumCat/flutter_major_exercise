//getting data from API, communicate w/ server

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:news_app/data/response/article_respone.dart';
import 'package:news_app/model/article.dart';
import '../constants/constants.dart';

class NewsService {
  final client = Client();

  //get response from server after "GET"
  Future<List<ArticleResponse>> getArticles(String country) async {
    final response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=${Constants.apiKey}'));

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

  Future<List<ArticleResponse>> searchArticle(String query) async {
    final response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=dc5e9aa3dda84ebabf439620e94ca31d"));

    if (response.statusCode != 200) {
      throw Exception("API error");
    }
    final decodedSearchedData = jsonDecode(response.body);
    log(decodedSearchedData.toString());
    final rawSearchedAricle = decodedSearchedData['articles'] as List;
    return rawSearchedAricle
        .map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
