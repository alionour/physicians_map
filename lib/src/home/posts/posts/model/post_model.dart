import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String? id;
  final String? title;
  final String? content;
  final String? author;
  final List<dynamic>? comments;
  final List<dynamic>? likes;
  final List<dynamic>? images;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const PostModel({
    this.id,
    this.title,
    this.content,
    this.author,
    this.comments,
    this.likes,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PostModel.fromMap(Map<String, dynamic> data) => PostModel(
        id: data['_id'] as String?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        author: data['author'] as String?,
        comments: data['comments'] as List<dynamic>?,
        likes: data['likes'] as List<dynamic>?,
        images: data['images'] as List<dynamic>?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        v: data['__v'] as int?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'title': title,
        'content': content,
        'author': author,
        'comments': comments,
        'likes': likes,
        'images': images,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostModel].
  factory PostModel.fromJson(String data) {
    return PostModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PostModel copyWith({
    String? id,
    String? title,
    String? content,
    String? author,
    List<dynamic>? comments,
    List<dynamic>? likes,
    List<dynamic>? images,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      author: author ?? this.author,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      content,
      author,
      comments,
      likes,
      images,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
