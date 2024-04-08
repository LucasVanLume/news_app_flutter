import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';

class HomeTopButtons extends StatelessWidget {
  const HomeTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                ActionButtom(icon: Icons.menu, onTap: () => {},),
                const Spacer(),
                ActionButtom(icon: Icons.notifications_none, onTap: () => {},),
              ],
            ),
            SearchButtom(), // Container(color: Colors.amber, child: Row(children:[Text('AQUI')]),),
          ],
        ),
      ),
    );
  }

}

class ActionButtom extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  const ActionButtom({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.inkWellButtom,
      borderRadius: BorderRadius.circular(56),
      child: InkWell(
        borderRadius: BorderRadius.circular(56),
        onTap: onTap,
        child: SizedBox(
          width: 56,
          height: 56,
          child: Icon(icon),
        ),
      ),
    );
  }
}

class SearchButtom extends StatefulWidget {
  const SearchButtom({super.key});

  @override
  State<SearchButtom> createState() => _SearchButtomState();
}

class _SearchButtomState extends State<SearchButtom> {
  var allItems = List.generate(50, (index) => 'item $index');

  var item = [];

  var searchHistory = [];

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover',
            style: TextStyle(
              color: Color.fromARGB(255, 85, 85, 85),
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: SearchBar(
              controller: searchController,
              backgroundColor: MaterialStateProperty.all(AppTheme.inkWellButtom),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/Unity FIT Logo.png',
                  width: 30,
                  height: 30,
                  color: AppTheme.iconNavBar,
                ),
              ),
              trailing: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),  
                  color: AppTheme.iconNavBar,
                ),
              ],
              hintText: 'Pesquisa',
            ),
          ),
        ],
      ),
    );
  }
}