import 'package:flutter/material.dart';
import 'package:my_news_app/constants/app_colors.dart';
import 'package:my_news_app/constants/my_url.dart';
import 'package:my_news_app/screens/category/categories/apple_news_screen.dart';
import 'package:my_news_app/screens/category/categories/bbc_news_screen.dart';
import 'package:my_news_app/screens/category/categories/general_screen.dart';
import 'package:my_news_app/screens/home_screen/all_news_screen.dart';
import 'package:my_news_app/screens/home_screen/carousel_slider_screen.dart';
import 'package:my_news_app/screens/home_screen/top_news_sceen.dart';

import '../category/categories/Science_news.dart';
import '../category/categories/business_screen.dart';
import '../category/categories/sports_news_screen.dart';
import '../category/categories/tesla_news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: MyUrl.category.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: MyUrl.category.length,
      child: Scaffold(
          backgroundColor: bgColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Top News'),
              const SizedBox(height: 10),
              SizedBox(height: 50, child: TopNewsScreen()),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics:const AlwaysScrollableScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 5),
                      height: 50,
                      width:size.width,
                      color: Colors.deepOrangeAccent,
                      child: TabBar(
                          onTap: (val) {
                            _currentIndex = val;
                          },
                          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                          isScrollable: true,
                          controller: _tabController,
                          tabs: List.generate(
                              MyUrl.category.length,
                                  (index) => Tab(
                                child: Text(MyUrl.category[index]),
                              ))),
                    ),
                  ],
                ),
              ),

              Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      CarouselSliderScreen(),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: size.height,
                        width: size.width,
                        child: TabBarView(controller: _tabController, children: [
                          GeneralScreen(),
                          BBCNewsScreen(),
                          AppleNewsScreen(),
                          TeslaNewsScreen(),
                          BusinessScreen(),
                          SportsNewsScreen(),
                          ScienceNewsScreen()
                        ]),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          height: size.height,
                          width: size.width,
                          child: AllNewsScreen()),
                    ],
                  )
              )

            ],
          )),
    );
  }
}
