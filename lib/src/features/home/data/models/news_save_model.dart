import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_save_model.g.dart';

@JsonSerializable()
class NewsSaveModel extends NewsSave {
  const NewsSaveModel({
    required super.id,
    //required super.source,
    required super.author,
    required super.title,
    required super.url,
    required super.urlToImage,
  });


  factory NewsSaveModel.fromJson(Map<String, dynamic> json) => _$NewsSaveModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsSaveModelToJson(this);
}