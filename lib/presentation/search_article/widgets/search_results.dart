import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
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
        if (state.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.query == '') {
          return const Center(
            child: Text("Type something in the search box"),
          );
        }

        if (state.articles.isEmpty == true) {
          return const Center(
            child: Text("No article found"),
          );
        }

        return Expanded(
          child: ListView.separated(
              itemBuilder: (contex, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      leading: Text(
                        (index + 1).toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        state.articles[index].title != null
                            ? state.articles[index].title!
                            : Constants.sampleLongText,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            state.articles[index].author != null
                                ? state.articles[index].author!
                                : "Annonymous",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (contex, index) => const SizedBox(height: 12),
              itemCount: state.articles.length),
        );
      },
    );
  }
}
