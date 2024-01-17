import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_article_event.dart';
part 'search_article_state.dart';

class SearchArticleBloc extends Bloc<SearchArticleEvent, SearchArticleState> {
  final newsRepo = NewsRepository();
  SearchArticleBloc() : super(const SearchArticleState()) {
    on<TypeInQuery>(_typeInQuery);
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
