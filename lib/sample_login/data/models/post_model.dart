// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class PostModel {
  final int id;
  final String title;
  final String content;
  final List<String> tags;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.tags,
  });

  // JSON -> global model
  //receive data
  factory PostModel.fromJson(Map<String, dynamic> json) {
    final PostModel model = PostModel(
      id: json['id'] as int,
      title: json['title'] as String,
      tags: json['tags'].cast<String>(),
      content: json['content'] as String,
    );
    return model;
  }

  //model -> JSON
  //submit data
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> toReturn = {};

    toReturn.addAll({'id': id});
    toReturn.addAll({'title': title});
    toReturn.addAll({'tags': tags});
    toReturn.addAll({'content': content});

    return toReturn;
  }

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, content: $content, tags: $tags)';
  }

  PostModel copyWith({
    int? id,
    String? title,
    String? content,
    List<String>? tags,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      tags: tags ?? this.tags,
    );
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ content.hashCode ^ tags.hashCode;
  }
}
