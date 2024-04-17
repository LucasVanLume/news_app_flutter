import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/ui/widgets/home_news_list_item.dart';

class HomeNewsList extends StatefulWidget {
  final List<News> listNews;
  const HomeNewsList({super.key, required this.listNews});

  @override
  State<HomeNewsList> createState() => _HomeNewsListState();
}

class _HomeNewsListState extends State<HomeNewsList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.listNews.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.listNews[index];

          return HomeNewsListItem(
            sourceName: item.source['name'],
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