import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_login/sample_login/post_list/post_list_view.dart';


import 'bloc/post_list_bloc.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostListBloc(),
      child: Scaffold(
        appBar: AppBar(),
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
