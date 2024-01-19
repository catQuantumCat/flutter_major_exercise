// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_list_bloc.dart';

class PostListState {
  final bool isLoading;
  final String error;
  final List<PostModel> posts;
  PostListState({
    this.isLoading = false,
    this.error = '',
    this.posts = const [],
  });

  PostListState copyWith({
    bool? isLoading,
    String? error,
    List<PostModel>? posts,
  }) {
    return PostListState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      posts: posts ?? this.posts,
    );
  }
}
