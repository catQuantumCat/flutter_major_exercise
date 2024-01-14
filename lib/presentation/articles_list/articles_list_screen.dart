import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample text"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(right: 16),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 44, 87, 161)),
              child: Row(children: [
                Expanded(
                  child: Image.network(
                    'https://i.kym-cdn.com/entries/icons/facebook/000/047/760/dt.jpg',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Constants.sampleLongText,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: 10),
    );
  }
}
