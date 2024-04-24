import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/states/saves_state.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/widgets/saves_news_save_list.dart';
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
                return SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SavesNewsSaveList(listNewsSave: state.list)
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
    );
  }
} 