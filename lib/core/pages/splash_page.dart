import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  splashSreenPage() async {
    //Future.delayed(const Duration(seconds: 3)).whenComplete(() => Modular.to.pushNamed('/auth'));
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.pushNamed('/auth');
  }

  @override
  void initState() {
    splashSreenPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppTheme.appColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
                scale: 0.25,
                child: Image.asset(
                  'assets/images/Unity FIT Logo.png',
                )
            ),
          ],
        ),
      ),
    );
  }
}
