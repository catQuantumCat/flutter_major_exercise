part of 'article_screen_bloc.dart';

abstract class ArticleScreenEvent {}

class GetData extends ArticleScreenEvent {
  final String country;
  GetData({this.country = 'us'});
}

class RefreshData extends ArticleScreenEvent {
  RefreshData();
}

class TapOneArticle extends ArticleScreenEvent {
  final Article selectedArtcle;
  TapOneArticle(this.selectedArtcle);
}
