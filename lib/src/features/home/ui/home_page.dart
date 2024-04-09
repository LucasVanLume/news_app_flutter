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
  late final Future<void> _fetchNewsFuture;

  @override
  void initState() {
    super.initState();
    _fetchNewsFuture = homeStore.fetchNews();

    _fetchNewsFuture.then((listNews) {});
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
                return const Center(
                  child: Text('START'),
                );
              } else if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SuccessState) {
                return SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      const HomeTopButtons(),
                      HomeNewsList(listNews: state.list),
                    ],
                  )
                );
              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
} 