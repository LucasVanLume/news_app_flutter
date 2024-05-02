import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/states/saves_state.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/saves_news_main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SavesPage extends StatefulWidget {
  const SavesPage({super.key});

  @override
  State<SavesPage> createState() => _SavesPageState();
}

class _SavesPageState extends State<SavesPage> {
  final savesStore = Modular.get<SavesStore>();

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  void loadNews() {
    savesStore.initSaves();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Observer(builder: (_) {
              var state = savesStore.state;

              if (state is StartState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );

              } else if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );

              } else if (state is SuccessState) {
                return SavesNewsMain(listNewsSave: state.listSaved, listNewsFavorite: state.listFavorited);
                // SafeArea(
                //   child: CustomScrollView(
                //     slivers: [
                //       //SavesNewsMain(),
                //       SavesNewsSaveList(listNewsSave: state.list)
                //     ],
                //   )
                // );

              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
} 