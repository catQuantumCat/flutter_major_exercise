import 'package:flutter/material.dart';


class SinglePost extends StatelessWidget {
  const SinglePost(
      {super.key,
      required this.title,
      required this.content,
      required this.tags});
  final String title;
  final String content;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title: $title"),
          const SizedBox(height: 16),
          Text("Content: $content"),
          const SizedBox(height: 16),
          Text("Tags: ${tags.join(', ')}")
        ],
      ),
    ));
  }
}
