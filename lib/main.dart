import 'package:flutter/material.dart';
import 'package:news_app/presentation/articles_list/articles_list_screen.dart';

void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ArticleListScreen();
  }
}
