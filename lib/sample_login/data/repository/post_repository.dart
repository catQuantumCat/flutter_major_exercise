import '../datasource/post_datasource.dart';
import '../models/post_model.dart';

class PostRepository {
  final _datasource = PostDatasource();

  Future<List<PostModel>> getPost() {    
    return _datasource.getPost();
  }

  Future<void> createPost(PostModel post) {
    return _datasource.createPost(post);
  }

  Future<void> deletePost(PostModel post) {
    return _datasource.deletePost(post);
  }
}
