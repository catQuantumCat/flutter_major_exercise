// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class PostModel {
  final int id;
  final String title;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  PostModel({
    required this.id,
    required this.title,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON -> global model
  //receive data
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'] as int,
        title: json['title'] as String,
        tags: json['tags'] as List<String>,
        createdAt: json['createdAt'] as DateTime,
        updatedAt: json['updatedAt'] as DateTime);
  }

  //model -> JSON
  //submit data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'tags': tags,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        listEquals(other.tags, tags) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        tags.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  PostModel copyWith({
    int? id,
    String? title,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
