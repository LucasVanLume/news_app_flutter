import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widgets/navBar/components/bottom_nav_bar.dart';
//import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavBarController>(
      create: (context) => BottomNavBarController(),
      child: Consumer<BottomNavBarController>(
        builder: (context, controller, child) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 3),
                const SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 3; i++)
                      BottomNavBar(
                        text: ['Discover', 'Salvos', 'Perfil'][i],
                        isActive: i == controller.activeIndex,
                        icon: [Icons.stream, Icons.bookmarks, Icons.person][i],
                        index: i,
                        onTap: () {
                          controller.changeActiveIndex(i);
                          //[Modular.to.navigate(router)][i];
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomNavBarController extends ChangeNotifier {
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  void changeActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}










// NavBar alternativa:

// class NavBarWidget extends StatefulWidget {
//   const NavBarWidget({super.key});

//   @override
//   State<NavBarWidget> createState() => _NavBarWidgetState();
// }

// class _NavBarWidgetState extends State<NavBarWidget> {
//   int _selectedIndex = 0;

//   void _changeSelectedIndex(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 80,
//         width: double.infinity,
//         alignment: Alignment.topCenter,
//         padding: const EdgeInsets.only(top: 20),
//         decoration: BoxDecoration(
//           color: AppTheme.appColor,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20)
//           ),
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 15,
//               offset: const Offset(0, 4),
//               color: Colors.black.withOpacity(0.15)
//             )
//           ]
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             GestureDetector(
//               onTap: () => _changeSelectedIndex(0),
//               child: Icon(
//                 Icons.people,
//                 color: _selectedIndex == 0 ? Colors.deepPurple[200] : Colors.white,
//                 size: 30,
//               )
//             ),
//             GestureDetector(
//               onTap: () => _changeSelectedIndex(1),
//               child: Icon(
//                 Icons.stacked_bar_chart,
//                 color: _selectedIndex == 1 ? Colors.deepPurple[200] : Colors.white,
//                 size: 30,
//               )
//             ),
//             GestureDetector(
//               onTap: () => _changeSelectedIndex(2),
//               child: Icon(
//                 Icons.fitness_center_rounded,
//                 color: _selectedIndex == 2 ? Colors.deepPurple[200] : Colors.white,
//                 size: 30,
//               )
//             ),
//             GestureDetector(
//               onTap: () => _changeSelectedIndex(3),
//               child: Icon(
//                 Icons.stars,
//                 color: _selectedIndex == 3 ? Colors.deepPurple[200] : Colors.white,
//                 size: 30,
//               )
//             )
//           ],
//         ),
//       );
//   }
// }