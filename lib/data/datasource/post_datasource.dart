import 'dart:async';
import 'dart:developer';

import 'package:sample_login/constants/api_const.dart';
import 'package:dio/dio.dart';
import 'package:sample_login/data/models/post_model.dart';

class PostDatasource {
  final dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

  Future<List<PostModel>> getPost() async {
    final response = await dio.get('/posts');
    log(response.toString());

    return (response.data as List<dynamic>)
        .map((onePost) => PostModel.fromJson(onePost as Map<String, dynamic>))
        .toList();
  }

  Future<void> createPost(PostModel post) async {
    final res = await dio.post('/posts', data: post.toJson());
    log(res.toString());
  }
}
