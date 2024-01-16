// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_article_bloc.dart';

abstract class SearchArticleEvent {}

class TypeInQuery extends SearchArticleEvent {
  final String query;
  TypeInQuery(
    this.query,
  );
}
