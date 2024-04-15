import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/stores/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeNewsList extends StatefulWidget {
  final List<News> listNews;
  const HomeNewsList({super.key, required this.listNews});

  @override
  State<HomeNewsList> createState() => _HomeNewsListState();
}

class _HomeNewsListState extends State<HomeNewsList> {
  final homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListView.builder(  
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.listNews.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var item = widget.listNews[index];                      
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                //
                height: size.height * 0.40,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(item.urlToImage ?? ''),
                    fit: BoxFit.cover,
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(''),
                                maxRadius: 20,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.author ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 15,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    item.source['name'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 15,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert, color: Colors.white,)
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    //SizedBox(height: 157,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 14,
                              right: 14
                              
                            ),
                            decoration: BoxDecoration(
                              // color: const Color(0xFFE5E5E5).withOpacity(0.8),
                              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.7),
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    ),
                                  ),
                                ],
                              ),
                            )
                          )
                        ],
                      )
                    )     
                  ],
                ),
              );
            }
          ),
          //const ProgressIndicator(),
        ],
      ),
    );
  }
}


class ProgressIndicator extends StatefulWidget {
  const ProgressIndicator({super.key});

  @override
  State<ProgressIndicator> createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator> {
  final homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var loading = homeStore.isLoading;
      if (loading){
        return const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: CircleAvatar(
            backgroundColor: AppTheme.white,
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                backgroundColor: AppTheme.appColor,
                color: AppTheme.white,
              )
            ),
          ),
        );
      } else {return Container();}
    });
  }
}