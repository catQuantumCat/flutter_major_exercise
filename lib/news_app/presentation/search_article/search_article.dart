import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/search_article_bloc.dart';
import 'search_article_view.dart';

class SearchArticle extends StatelessWidget {
  const SearchArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchArticleBloc(),
      child: const SearchArticleView(),
    );
  }
}
