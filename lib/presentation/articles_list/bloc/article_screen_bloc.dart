import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/repository/news_repository.dart';

part 'article_screen_event.dart';
part 'article_screen_state.dart';

class ArticleScreenBloc extends Bloc<ArticleScreenEvent, ArticleScreenState> {
  ArticleScreenBloc() : super(ArticleScreenState()) {
    on<GetData>(_onGetData);

    on<RefreshData>((event, emit) {});
    on<TapOneArticle>(_onTapOneArticle);
    add(GetData());
  }

  FutureOr<void> _onTapOneArticle(event, emit) {
    emit(DetailArticleState(
        selectedArtcle: event.selectedArtcle,
        isLoading: state.isLoading,
        articles: state.articles,
        error: state.error,
        country: state.country));
  }

  final newsRepo = NewsRepository();

  FutureOr<void> _onGetData(
      GetData event, Emitter<ArticleScreenState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final article = await newsRepo.getArticles(country: event.country);
      emit(state.copyWith(
          isLoading: false, articles: article, country: event.country));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
