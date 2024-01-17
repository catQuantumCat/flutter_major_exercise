import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/presentation/search_article/bloc/search_article_bloc.dart';

class SearchResultsLayout extends StatelessWidget {
  const SearchResultsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (contex, index) {
            return Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  leading: Text(
                    (index + 1).toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                  title: const Text(
                    Constants.sampleLongText,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "By annonymous",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (contex, index) => const SizedBox(height: 12),
          itemCount: 10),
    );
    ;
  }
}
