import 'package:sample_login/data/datasource/post_datasource.dart';
import 'package:sample_login/data/models/post_model.dart';

class PostRepository {
  final _datasource = PostDatasource();

  //q: why async here?
  Future<List<PostModel>> getPost() async {
    return _datasource.getPost();
  }
}
