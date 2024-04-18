import 'package:floor/floor.dart';

@Entity(tableName: 'newsTable')
class NewsSave {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  //final Map source;
  final String? author;
  final String? title;
  final String? url;
  final String? urlToImage;


  const NewsSave({
    required this.id,
    //required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
  });
}