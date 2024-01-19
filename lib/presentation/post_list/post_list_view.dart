import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_login/presentation/post_list/bloc/post_list_bloc.dart';
import 'package:sample_login/presentation/post_list/post_list.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (ctx, index) => Card(
                    child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            itemCount: 10);
      },
    );
  }
}
