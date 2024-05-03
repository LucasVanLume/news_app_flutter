import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_save_list_item.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SavesNewsSaveList extends StatefulWidget {
  final List<NewsSaved> listNewsSave;
  const SavesNewsSaveList({super.key, required this.listNewsSave});

  @override
  State<SavesNewsSaveList> createState() => _SavesNewsSaveListState();
}

class _SavesNewsSaveListState extends State<SavesNewsSaveList> {
  final savesStore = Modular.get<SavesStore>();

  @override
  void initState() {
    super.initState();

    savesStore.setAtSavesOrAtFavorites(true, false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.listNewsSave.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        var item = widget.listNewsSave[index];
    
        return SavesNewsSaveListItem(
          //idxNews: index,
          //id: item.id!,
          author: item.author!,
          title: item.title!,
          urlToImage: item.urlToImage!,
          url: item.url!, 
          onTapDelete: () async {
            final newsDelete = NewsSaved(author: item.author, title: item.title, url: item.url, urlToImage: item.urlToImage);

            savesStore.deleteSaves(newsDelete);
          },
        );  
      }       
    );
  }
}