import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widgets/navBar/nav_bar_widget.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/states/home_state.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/stores/home_store.dart';
import 'package:flutter_clean_architecture/src/features/home/ui/widgets/home_news_list.dart';
import 'package:flutter_clean_architecture/src/features/home/ui/widgets/home_top_buttons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = Modular.get<HomeStore>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(infineScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void loadNews() {
    homeStore.init();
  }

  Future<void> infineScrolling() async {
    if (!homeStore.isSearching && _scrollController.offset == _scrollController.position.maxScrollExtent) {
        homeStore.setISRefreshNews(false);
        loadMoreNews();
    }
  }

  void loadMoreNews() async {
    homeStore.setIsLoading(true);
    //await Future.delayed(const Duration(seconds: 2));
    homeStore.fetchNews(homeStore.isRefreshNews);
  }

  Future<void> refreshNews() async {
    homeStore.setISRefreshNews(true);
    homeStore.setIsSearching(false);
    await Future.delayed(const Duration(seconds: 2))
      .whenComplete(loadMoreNews);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Observer(builder: (_) {
              var state = homeStore.state;

              if (state is StartState) {
                loadNews();
                return const Center(
                  child: CircularProgressIndicator(),
                );

              } else if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );

              } else if (state is SuccessState) {
                return SafeArea(
                  child: RefreshIndicator(
                    onRefresh: refreshNews,
                    color: Theme.of(context).primaryColor,
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        const HomeTopButtons(),
                        HomeNewsList(listNews: state.list),
                      ],
                    ),
                  )
                );

              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
} 