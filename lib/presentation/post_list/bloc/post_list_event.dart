part of 'post_list_bloc.dart';

@immutable
sealed class PostListEvent {}

class GetPostData extends PostListEvent {
  GetPostData();
}
