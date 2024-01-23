import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';
import '../../model/article.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            Image.network(
              article.urlToImage != null
                  ? article.urlToImage!
                  : Constants.placeHolderImageURL,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title!.split(' - ').first,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    article.author != null
                        ? 'By ${article.author}'
                        : 'Annoymous',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    DateFormat('d/M/y hh:mm a').format(article.publishedAt!),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(article.content != null
                      ? article.content!
                      : Constants.sampleLongText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
