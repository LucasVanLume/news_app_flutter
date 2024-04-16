import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widgets/navBar/nav_bar_widget.dart';
import 'package:flutter_clean_architecture/src/features/home/ui/home_page.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/saves_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  setCurrentPage (index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: setCurrentPage,
        children: const [
          HomePage(),
          SavesPage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: NavBarWidget(
        currentIndex: currentIndex,
        onTap: (int index) {
          _pageController.jumpToPage(index); 
        },
      ),
    );
  }
}