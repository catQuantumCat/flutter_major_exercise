import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/repository/news_repository.dart';

part 'search_article_event.dart';
part 'search_article_state.dart';

class SearchArticleBloc extends Bloc<SearchArticleEvent, SearchArticleState> {
  final newsRepo = NewsRepository();
  SearchArticleBloc() : super(SearchArticleState()) {
    on<TypeInQuery>(_typeInQuery);
  }

  FutureOr<void> _typeInQuery(event, emit) async {
    try {
      if (state.query.isEmpty) {
        return;
      }
      emit(state.copyWith(isLoading: true));
      final searchedArticle = await newsRepo.searchArticles(query: event.query);
      emit(state.copyWith(isLoading: false, articles: searchedArticle));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
    }
  }
}
