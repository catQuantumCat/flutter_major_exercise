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
    add(GetData());
  }
  final newsRepo = NewsRepository();

  FutureOr<void> _onGetData(
      GetData event, Emitter<ArticleScreenState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final article = await newsRepo.getArticles();
      emit(state.copyWith(isLoading: false, articles: article));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
