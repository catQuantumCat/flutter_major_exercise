import 'package:flutter/material.dart';
import 'widgets/search_box.dart';
import 'widgets/search_results.dart';

class SearchArticleView extends StatelessWidget {
  const SearchArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Column(
          children: [
            SearchBox(),
            SizedBox(height: 12),
            SearchResults(),
          ],
        ),
      ),
    );
  }
}
