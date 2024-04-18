// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_save_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSaveModel _$NewsSaveModelFromJson(Map<String, dynamic> json) =>
    NewsSaveModel(
      id: json['id'] as int?,
      author: json['author'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
    );

Map<String, dynamic> _$NewsSaveModelToJson(NewsSaveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
    };
