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











// HomePage Alternantiva:

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   final homeStore = Modular.get<HomeStore>();
//   late final Future<void> _fetchNewsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _fetchNewsFuture = homeStore.fetchNews();

//     _fetchNewsFuture.then((listNews) {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppTheme.appColor,
//         automaticallyImplyLeading: false,
//         centerTitle: false,
//         title: const Padding(
//           padding: EdgeInsets.only(left: 15.0),
//           child: Text(
//             'News',
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Observer(builder: (_) {
//               var state = homeStore.state;

//               if (state is StartState) {
//                 return const Center(
//                   child: Text('START'),
//                 );
//               } else if (state is LoadingState) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (state is SuccessState) {
//                 return CustomScrollView(
//                   slivers: [
//                     SliverPersistentHeader(
//                       pinned: true,
//                       delegate: _SliverTopHeaderDelegate(
//                         child: _buildTop(state.list),
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: _buildNewsFeed(state.list),
//                     ),
//                   ],
//                 );
//               } else {
//                 return Container();
//               }
//             }),
//           ),
//         ],
//       ),
//       bottomNavigationBar: const NavBarWidget(),
//     );
//   }

//   Widget _buildTop(List<News> listNews) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               AppTheme.appColor,
//               AppTheme.appColor,
//               AppTheme.appColor.withAlpha(200),
//               Colors.white.withAlpha(0),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               child: Row(
//                 children: [
//                   for (int i = 0; i < 2; i++)
//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 40,
//                           backgroundImage: AssetImage('assets/logos/Bloomberg.jpg'),
//                         ),
//                         const CircleAvatar(
//                           radius: 40,
//                           backgroundImage: AssetImage('assets/logos/Fox News.jpg'),
//                         ),
//                         const CircleAvatar(
//                           radius: 40,
//                           backgroundImage: AssetImage('assets/logos/CNN.jpg'),
//                         ),
//                         if (i != 4) const SizedBox(width: 10),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNewsFeed(List<News> listNews) {
//     Size size = MediaQuery.of(context).size;
//     int sum = 0;
//     return ListView.builder(  
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 5,
//       shrinkWrap: true,
//       itemBuilder: (BuildContext context, int index) {
//         var item = listNews[index + sum];
//         while (index < listNews.length - 1 && (item.author == null || item.source['name'] == null || item.urlToImage == null)) {
//           item = listNews[index+sum+1];
//           sum++;
//         }
                              
//         return Container(
//           margin: const EdgeInsets.symmetric(
//             horizontal: 24,
//             vertical: 32,
//           ),
//           //
//           height: size.height * 0.40,
//           width: size.width,
//           decoration: BoxDecoration(
//             color: Colors.amber,
//             borderRadius: BorderRadius.circular(20),
//             image: DecorationImage(
//               image: NetworkImage(item.urlToImage ?? ''),
//               fit: BoxFit.cover,
//             )
//           ),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(14),
//                 child: Row(
//                   children: [
//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           backgroundImage: AssetImage(''),
//                           maxRadius: 20,
//                         ),
//                         const SizedBox(width: 8),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               item.author ?? '',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w900,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.black,
//                                     blurRadius: 15,
//                                     offset: Offset(0, 0),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Text(
//                               item.source['name'] ?? '',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w900,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.black,
//                                     blurRadius: 15,
//                                     offset: Offset(0, 0),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.more_vert, color: Colors.white,)
//                     )
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               //SizedBox(height: 157,),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.only(
//                         top: 10,
//                         bottom: 10,
//                         left: 14,
//                         right: 14
                        
//                       ),
//                       decoration: BoxDecoration(
//                         // color: const Color(0xFFE5E5E5).withOpacity(0.8),
//                         color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.7),
//                         borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
//                       ),
//                       child: RichText(
//                         text: TextSpan(
//                           style: const TextStyle(color: Colors.white),
//                           children: [
//                             TextSpan(
//                               text: item.title,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     )
//                   ],
//                 )
//               )
//             ],
//           ),
//         );
//       }
//     );
//   }
// }

// class _SliverTopHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;

//   _SliverTopHeaderDelegate({required this.child});

//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }

//   @override
//   double get maxExtent => 110.0;

//   @override
//   double get minExtent => 110.0;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
// }

