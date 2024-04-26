import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';


class SavesNewsSaveListItem extends StatelessWidget {
  final String author; 
  final String title;
  final String urlToImage;
  final String url;
  const SavesNewsSaveListItem(
      {super.key,
      required this.author,
      required this.title,
      required this.urlToImage,
      required this.url,});

  Future<void> launchUri(uri) async {
    Uri url = Uri.parse(uri);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final savesStore = Modular.get<SavesStore>();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: size.height * 0.28,
            width: size.width,
            decoration: BoxDecoration(
              color: AppTheme.inkWellButtom,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(urlToImage),
                fit: BoxFit.cover,
              )
            )
          ),
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppTheme.appColor
              ),
              child: const Center(
                child: Text(
                  "Business",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Material(
              color: AppTheme.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(56),
              child: InkWell(
                borderRadius: BorderRadius.circular(56),
                onTap: () async {
                  final newsDelete = NewsSaved(author: author, title: title, url: url, urlToImage: urlToImage);

                  savesStore.deleteSaves(newsDelete);
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red.shade800,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  AppTheme.black08,
                  AppTheme.black06,
                  AppTheme.black00,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}