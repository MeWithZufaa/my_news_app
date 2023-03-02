import 'package:flutter/material.dart';
import 'package:my_news_app/constants/app_colors.dart';
import 'package:my_news_app/screens/home_screen/all_news_screen.dart';
import 'package:my_news_app/screens/home_screen/carousel_slider_screen.dart';
import 'package:my_news_app/screens/home_screen/top_news_sceen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        shrinkWrap: true,
        padding:const EdgeInsets.all(10),
        children: [
          const Text('Top News'),
          const SizedBox(height: 10,),
          SizedBox(
              height: 50,
              child: TopNewsScreen()),

            const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:const [
              Text("All"),
              Text("View All")
            ],
          ),
          const SizedBox(height: 10,),
          CarouselSliderScreen(),
          AllNewsScreen()
        ],
      )
    );
  }
}
