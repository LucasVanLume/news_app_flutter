import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/configs/language/app_settings_language.dart';
import 'package:flutter_clean_architecture/core/widgets/navBar/components/bottom_nav_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;
  NavBarWidget({super.key, required this.currentIndex, required this.onTap});

  final appSettings = Modular.get<AppSettingsLanguage>();

  @override
  Widget build(BuildContext context) {
    final translations = appSettings.readTexts(context);
    
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
                  text: ['Discover', translations['saveNavBar'] ?? 'Salvos', translations['profileNavBar'] ?? 'Perfil'][i],
                  isActive: i == currentIndex,
                  icon: [Icons.stream, Icons.bookmarks, Icons.person][i],
                  index: i,
                  onTap: () {
                    onTap(i);
                  },
                ),
            ],
          ),
          const SizedBox(height: 1),
        ],
      ),
    );
  }
}