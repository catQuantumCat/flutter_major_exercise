import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_login/data/models/post_model.dart';
import 'package:sample_login/data/repository/post_repository.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  PostListBloc() : super(PostListState()) {
    final repo = PostRepository();

    on<PostListEvent>((PostListEvent event, Emitter<PostListState> emit) async {
      emit(state.copyWith(isLoading: true));
      final listOfPost = await repo.getPost();
      emit(state.copyWith(isLoading: false, posts: listOfPost));
    });
  }
}
