import 'package:flutter/material.dart';

class SavesPage extends StatefulWidget {
  const SavesPage({super.key});

  @override
  State<SavesPage> createState() => _SavesPageState();
}

class _SavesPageState extends State<SavesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SAVES'))
      //bottomNavigationBar: NavBarWidget(),
    );
  }
}