import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants/api_const.dart';
import '../models/post_model.dart';


class PostDatasource {
  final dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

  Future<List<PostModel>> getPost() async {
    final response = await dio.get('/posts');

    return (response.data as List<dynamic>)
        .map((onePost) => PostModel.fromJson(onePost as Map<String, dynamic>))
        .toList();
  }

  Future<void> createPost(PostModel post) async {
    final res = await dio.post('/posts', data: post.toJson());
    log(res.toString());
  }

  Future<void> deletePost(PostModel post) async {
    final res = await dio.delete('/posts/${post.id}');
    log(res.toString());
  }
}
