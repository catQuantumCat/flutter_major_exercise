import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../model/article.dart';
import '../../../repository/news_repository.dart';

part 'search_article_event.dart';
part 'search_article_state.dart';

class SearchArticleBloc extends Bloc<SearchArticleEvent, SearchArticleState> {
  final newsRepo = NewsRepository();
  SearchArticleBloc() : super(SearchArticleState()) {
    on<TypeInQuery>(_typeInQuery);
    on<TapOneResult>(_tapOneResult);
  }

  FutureOr<void> _tapOneResult(event, emit) {
    emit(ReadOneResultState(
        article: event.article,
        isLoading: state.isLoading,
        articles: state.articles,
        error: state.error,
        query: state.query));
  }

  FutureOr<void> _typeInQuery(
      TypeInQuery event, Emitter<SearchArticleState> emit) async {
    if (event.query == '') {
      emit(state.copyWith(query: event.query, error: ''));
      return;
    }
    try {
      emit(state.copyWith(isLoading: true));
      final searchedArticle = await newsRepo.searchArticles(query: event.query);
      emit(state.copyWith(
          isLoading: false, articles: searchedArticle, query: event.query));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
    }
  }
}
