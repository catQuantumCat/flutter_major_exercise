import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (ctx, index) => Card(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title:"),
                    SizedBox(height: 16),
                    Text("Content:"),
                    SizedBox(height: 16),
                    Text("Tags: ")
                  ],
                ),
              )),
          separatorBuilder: (ctx, index) => const SizedBox(
                height: 8,
              ),
          itemCount: 10),
    );
  }
}
