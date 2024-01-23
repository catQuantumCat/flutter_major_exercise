import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_list_bloc.dart';
import 'post_list_view.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostListBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Posts",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: const PostListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(Icons.add), // Set the shape to CircleBorder
        ),
      ),
    );
  }
}
