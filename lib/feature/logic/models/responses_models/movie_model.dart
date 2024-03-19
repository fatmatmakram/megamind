 import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'movie_model.g.dart';
@HiveType(typeId: 0)
class MovieModel {

  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? body;

  MovieModel({
     this.id,
    this.title,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
       'title': title,
      'release_date': body,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
       id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['release_date'] != null ? map['release_date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}