import 'package:floor/floor.dart';

@Entity(tableName: 'newsTable')
class NewsSave {
  //@PrimaryKey(autoGenerate: true)
  //@PrimaryKey()
  //final int? id;
  //final int? idxNews;
  //final Map source;
  final String? author;
  @PrimaryKey()
  final String? title;
  final String? url;
  final String? urlToImage;


  NewsSave({
    //this.id,
    //required this.idxNews,
    //required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
  });
}