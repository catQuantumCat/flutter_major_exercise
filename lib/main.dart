import 'package:flutter/material.dart';

import 'news_app/presentation/articles_list/articles_screen.dart';
import 'sample_login/presentation/post_list/post_list.dart';


void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return const ArticleScreen();
    return const PostList();
  }
}
