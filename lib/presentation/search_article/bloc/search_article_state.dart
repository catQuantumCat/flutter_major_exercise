// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_article_bloc.dart';

class SearchArticleState extends Equatable {
  final List<Article> articles;
  final bool isLoading;
  final String error;
  final String query;

  @override
  List<Object> get props => [articles, isLoading, error, query];

  const SearchArticleState(
      {this.articles = const <Article>[],
      this.isLoading = false,
      this.error = '',
      this.query = ''});

  SearchArticleState copyWith({
    List<Article>? articles,
    bool? isLoading,
    String? error,
    String? query,
  }) {
    return SearchArticleState(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      query: query ?? this.query,
    );
  }
}
