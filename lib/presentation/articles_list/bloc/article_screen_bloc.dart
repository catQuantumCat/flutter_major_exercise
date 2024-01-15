import 'dart:async';
import 'dart:developer';
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
    log(event.selectedArtcle.toString());
    emit(DetailArticleState(
        selectedArtcle: event.selectedArtcle,
        isLoading: state.isLoading,
        articles: state.articles,
        error: state.error));
  }

  final newsRepo = NewsRepository();

  Future<void> _onGetData(
      GetData event, Emitter<ArticleScreenState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final article = await newsRepo.getArticles();
      emit(state.copyWith(isLoading: false, articles: article));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
