import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/articles_list/article_screen_view.dart';

import 'bloc/article_screen_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleScreenBloc(),
      child: const ArticleScreenView(),
    );
  }
}
