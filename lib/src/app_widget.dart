import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      title: 'My cleanArch app',
      theme: ThemeData(
        primaryColor: AppTheme.appColor
      ),

      debugShowCheckedModeBanner: false,
      // routerConfig: Modular.routerConfig,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}