import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/stores/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeNewsListItem extends StatelessWidget {
  //final int idxNews;
  final String sourceName;
  final String author; 
  final String title;
  final String urlToImage;
  final String url;
  const HomeNewsListItem(
      {super.key,
      //required this.idxNews,
      required this.sourceName,
      required this.author,
      required this.title,
      required this.urlToImage,
      required this.url});

  Future<void> launchUri(uri) async {
    Uri url = Uri.parse(uri);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeStore = Modular.get<HomeStore>();

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => launchUri(url),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.title,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 212, 212, 212),
                  backgroundImage: AssetImage(''),
                  maxRadius: 12,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          color: AppTheme.title,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        sourceName,
                        style: const TextStyle(
                          color: AppTheme.iconNavBar,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40,),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: AppTheme.iconNavBar,
                  )
                ),
                IconButton(
                  onPressed: () async {
                    final news = NewsSave(author: author, title: title, url: url, urlToImage: urlToImage);

                    homeStore.saveNews(news);
                  },
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: AppTheme.iconNavBar,
                  )
                )
              ],
            ),
            const SizedBox(
              height: 10
            ),
            const Divider(),
      
          ],
        ),
      ),
    );
  }
}