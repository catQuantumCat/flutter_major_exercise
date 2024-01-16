import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/constants/list_of_countries.dart';
import 'package:news_app/presentation/articles_list/bloc/article_screen_bloc.dart';
import 'package:news_app/presentation/articles_list/widgets/list_widget.dart';

class ArticleScreenView extends StatelessWidget {
  const ArticleScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample title"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          BlocBuilder<ArticleScreenBloc, ArticleScreenState>(
            builder: (ctx, state) {
              return DropdownMenu(
                  initialSelection: ctx.read<ArticleScreenBloc>().state.country,
                  onSelected: (value) {
                    ctx.read<ArticleScreenBloc>().add(GetData(country: value!));
                  },
                  dropdownMenuEntries: listOfCountries.entries
                      .map((e) =>
                          DropdownMenuEntry(value: e.key, label: e.value))
                      .toList());
            },
          ),
          const ListWidget(),
        ],
      ),
    );
  }
}
