// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'article_screen_bloc.dart';

//all of possible stages of article list
class ArticleScreenState {
  final bool isLoading;
  final String error;
  final List<Article> articles;
  final String country;

  //constructor of state
  //with default value
  ArticleScreenState({
    this.isLoading = false,
    this.error = '',
    this.articles = const <Article>[],
    this.country = '',
  });

  ArticleScreenState copyWith({
    bool? isLoading,
    String? error,
    List<Article>? articles,
    String? country,
  }) {
    return ArticleScreenState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      articles: articles ?? this.articles,
      country: country ?? this.country,
    );
  }
}

class DetailArticleState extends ArticleScreenState {
  final Article selectedArtcle;

  DetailArticleState(
      {super.isLoading,
      super.error,
      super.articles,
      super.country,
      required this.selectedArtcle});
}
