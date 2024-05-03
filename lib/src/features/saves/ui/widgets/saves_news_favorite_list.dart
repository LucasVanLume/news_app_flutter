import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_save_list_item.dart';


class SavesNewsFavoriteList extends StatefulWidget {
  final List<NewsFavorited> listNewsFavorite;
  const SavesNewsFavoriteList({super.key, required this.listNewsFavorite});

  @override
  State<SavesNewsFavoriteList> createState() => _SavesNewsFavoriteListState();
}

class _SavesNewsFavoriteListState extends State<SavesNewsFavoriteList> {
  final savesStore = Modular.get<SavesStore>();

  @override
  void initState() {
    super.initState();

    savesStore.setAtSavesOrAtFavorites(false, true);
  }

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
          onTapDelete: () async {
            final newsDelete = NewsFavorited(author: item.author, title: item.title, url: item.url, urlToImage: item.urlToImage);

            savesStore.deleteFavorites(newsDelete);
          },
        );  
      }       
    );
  }
}