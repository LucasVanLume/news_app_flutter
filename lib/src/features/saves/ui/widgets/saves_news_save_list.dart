import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_save_list_item.dart';


class SavesNewsSaveList extends StatefulWidget {
  final List<NewsSaved> listNewsSave;
  const SavesNewsSaveList({super.key, required this.listNewsSave});

  @override
  State<SavesNewsSaveList> createState() => _SavesNewsSaveListState();
}

class _SavesNewsSaveListState extends State<SavesNewsSaveList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
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
          );  
        }       
      ),
    );
  }
}