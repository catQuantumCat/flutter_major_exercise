import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/search_article/bloc/search_article_bloc.dart';
import 'package:news_app/presentation/search_article/widgets/search_results.dart';

class SearchArticleView extends StatelessWidget {
  const SearchArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                context.read<SearchArticleBloc>().add(TypeInQuery(text));
              },
            ),
            const SearchResults(),
          ],
        ),
      ),
    );
  }
}
