import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_article_bloc.dart';


class SearchBox extends StatelessWidget {
  const SearchBox({super.key});
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          hintText: "Search"),
      onChanged: (text) {
        if (!context.mounted) return;
        context.read<SearchArticleBloc>().add(TypeInQuery(text));
      },
    );
  }
}
