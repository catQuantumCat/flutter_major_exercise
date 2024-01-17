import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/search_article/bloc/search_article_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchArticleBloc, SearchArticleState>(
      builder: (context, state) {
        if (state.error != '') {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        if (state.query == '') {
          return const Center(
            child: Text("Type something in the search box"),
          );
        }
        if (state.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.articles.isEmpty == true) {
          return const Center(
            child: Text("No article found"),
          );
        }

        return ListView.separated(
            itemBuilder: (contex, index) {
              return InkWell(
                child: Text(state.articles[index].title != null
                    ? state.articles[index].title!
                    : "Sample title"),
              );
            },
            separatorBuilder: (contex, index) => const SizedBox(height: 8),
            itemCount: state.articles.length);
      },
    );
  }
}
