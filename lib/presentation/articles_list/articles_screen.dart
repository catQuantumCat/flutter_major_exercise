import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/detail_article/detail_article_screen.dart';
import '../../constants/constants.dart';
import 'bloc/article_screen_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleScreenBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News!"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: BlocConsumer<ArticleScreenBloc, ArticleScreenState>(
          listener: (contex, state) {
            if (state is DetailArticleState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) =>
                      DetailArticleScreen(article: state.selectedArtcle)));
            }
          },
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != '') {
              return Center(child: Text(state.error));
            }

            if (state.articles.isEmpty) {
              return const Center(child: Text("No article found"));
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 44, 87, 161)),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<ArticleScreenBloc>()
                            .add(TapOneArticle(state.articles[index]));
                      },
                      child: Row(children: [
                        Expanded(
                          child: Image.network(
                            state.articles[index].urlToImage != null
                                ? state.articles[index].urlToImage!
                                : Constants.placeHolderImageURL,
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.articles[index].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.articles[index].description != null
                                    ? state.articles[index].description!
                                    : Constants.sampleLongText,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: state.articles.length);
          },
        ),
      ),
    );
  }
}
