// import 'package:flutter/material.dart';
// import 'package:my_news_app/constants/my_url.dart';
// import 'package:my_news_app/screens/category/categories/Science_news.dart';
// import 'package:my_news_app/screens/category/categories/apple_news_screen.dart';
// import 'package:my_news_app/screens/category/categories/bbc_news_screen.dart';
// import 'package:my_news_app/screens/category/categories/business_screen.dart';
// import 'package:my_news_app/screens/category/categories/general_screen.dart';
// import 'package:my_news_app/screens/category/categories/sports_news_screen.dart';
// import 'package:my_news_app/screens/category/categories/tesla_news_screen.dart';
// import 'package:my_news_app/widgets/reusable_text.dart';
//
// class CategoryScreen extends StatefulWidget {
//   const CategoryScreen({
//     super.key,
//   });
//
//   @override
//   State<CategoryScreen> createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<CategoryScreen>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   int _currentIndex = 0;
//   @override
//   void initState() {
//     _tabController = TabController(length: MyUrl.category.length, vsync: this);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size=MediaQuery.of(context).size;
//     return DefaultTabController(
//       length: MyUrl.category.length,
//       child: Scaffold(
//         body: Column(
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               physics:const AlwaysScrollableScrollPhysics(),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     padding:const EdgeInsets.symmetric(horizontal: 5),
//                     height: 50,
//                     width:size.width,
//                     color: Colors.deepOrangeAccent,
//                     child: TabBar(
//                         onTap: (val) {
//                           _currentIndex = val;
//                         },
//                         labelPadding: const EdgeInsets.symmetric(horizontal: 8),
//                         isScrollable: true,
//                         controller: _tabController,
//                         tabs: List.generate(
//                             MyUrl.category.length,
//                                 (index) => Tab(
//                               child: Text(MyUrl.category[index]),
//                             ))),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(controller: _tabController, children: [
//                 GeneralScreen(),
//                 BBCNewsScreen(),
//                 AppleNewsScreen(),
//                 TeslaNewsScreen(),
//                 BusinessScreen(),
//                 SportsNewsScreen(),
//                 ScienceNewsScreen()
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }