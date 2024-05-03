import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_add_news_form.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_clean_architecture/core/configs/language/app_settings_language.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_save_list.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_favorite_list.dart';


class SavesNewsMain extends StatefulWidget {
  final List<NewsSaved> listNewsSave;
  final List<NewsFavorited> listNewsFavorite;
  const SavesNewsMain({super.key, required this.listNewsSave, required this.listNewsFavorite});

  @override
  State<SavesNewsMain> createState() => _SavesNewsMainState();
}

class _SavesNewsMainState extends State<SavesNewsMain> {
  final appSettings = Modular.get<AppSettingsLanguage>();
  
  @override
  Widget build(BuildContext context) {
    final translations = appSettings.readTexts(context);

    void openAddNews(BuildContext context, var val) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: val,
          );
        }
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              translations['interestsTitleSaves'] ?? 'Interesses',
              style: const TextStyle(
                color: AppTheme.title,
                fontWeight: FontWeight.w500,
                fontSize: 23,
              ),
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            indicatorColor: AppTheme.appColor,
            labelColor: AppTheme.appColor,
            unselectedLabelColor: AppTheme.title,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            tabs: [
              Tab(text: translations['savesAppBarSaves'] ?? 'Salvos'),
              Tab(text: translations['favoritesAppBarSaves'] ?? 'Favoritos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SavesNewsSaveList(listNewsSave: widget.listNewsSave),
            SavesNewsFavoriteList(listNewsFavorite: widget.listNewsFavorite)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openAddNews(context, const SavesAddNewsForm());
          },
          backgroundColor: AppTheme.appColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: const Icon(
            Icons.add,
            color: AppTheme.white,
            size: 32,
          ),
        ),
      ),
    );
  }

}