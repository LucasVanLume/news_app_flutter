import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_save_list_item.dart';


class SavesNewsFavoriteList extends StatefulWidget {
  final List<NewsFavorited> listNewsFavorite;
  const SavesNewsFavoriteList({super.key, required this.listNewsFavorite});

  @override
  State<SavesNewsFavoriteList> createState() => _SavesNewsFavoriteListState();
}

class _SavesNewsFavoriteListState extends State<SavesNewsFavoriteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.listNewsFavorite.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        var item = widget.listNewsFavorite[index];
    
        return SavesNewsSaveListItem(
          //idxNews: index,
          //id: item.id!,
          author: item.author!,
          title: item.title!,
          urlToImage: item.urlToImage!,
          url: item.url!, 
          onTapDelete: () {},
        );  
      }       
    );
  }
}