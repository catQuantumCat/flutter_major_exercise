import 'dart:async';
import 'dart:developer';

import 'package:sample_login/constants/api_const.dart';
import 'package:dio/dio.dart';

class PostDatasource {
  final dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

  Future<void> getPost() async {
    final response = await dio.get('/posts');
    // log(response.toString());
  }
}
