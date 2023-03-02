import 'package:flutter/material.dart';
import 'package:my_news_app/constants/app_colors.dart';
import 'package:my_news_app/screens/home_screen/home_screen.dart';
import 'package:my_news_app/widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pages = [
    const HomeScreen(),
    const Text("Second Screen"),
    const Text("Favourite Screen")
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Global News"),
        centerTitle: true,
        backgroundColor: bgColor,
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
            ],
          )
        ],
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: customNavigationBar(),
      body: pages[pageIndex],
    );
  }

  Widget customNavigationBar() {
    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_outlined,
                      color: Colors.deepOrangeAccent,
                      size: 35,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.videocam_outlined,
                      color: Colors.deepOrangeAccent,
                      size: 35,
                    )
                  : const Icon(
                      Icons.videocam_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.favorite_border,
                      color: Colors.deepOrangeAccent,
                      size: 35,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
          ],
        ));
  }
}
