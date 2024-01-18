import 'package:sample_login/data/datasource/post_datasource.dart';
import 'package:sample_login/data/models/post_model.dart';

class PostRepository {
  final _datasource = PostDatasource();

  Future<List<PostModel>> getPost() {
    return _datasource.getPost();
  }

  Future<void> createPost(PostModel post) {
    return _datasource.createPost(post);
  }
}
