import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/search_article_bloc.dart';
import 'widgets/search_results.dart';

class SearchArticleView extends StatelessWidget {
  const SearchArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  hintText: "Search"),
              onChanged: (text) {
                context.read<SearchArticleBloc>().add(TypeInQuery(text));
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const SearchResults(),
          ],
        ),
      ),
    );
  }
}
