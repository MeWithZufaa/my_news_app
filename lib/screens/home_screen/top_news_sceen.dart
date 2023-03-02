import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marqueer/marqueer.dart';
import 'package:my_news_app/constants/app_colors.dart';
import 'package:my_news_app/controllers/top_news_controller.dart';

class TopNewsScreen extends StatelessWidget {

   TopNewsScreen({Key? key,}) : super(key: key);

   final controller = MarqueerController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        title: GetBuilder<TopNewsController>(
          init: TopNewsController(),
          builder: (_newsController) {
            if (_newsController.isLoading.value|| _newsController.hasError.value) {
              return Text("Top Headline");
            } else {
              final topHeadline = _newsController.topNewsList[0].title;
              return SizedBox(
                height: 30,
                child: Marqueer(
                  pps: 100, /// optional
                  controller: controller, /// optional
                  direction: MarqueerDirection.rtl,  /// optional
                  restartAfterInteractionDuration: const Duration(seconds: 6), /// optional
                  restartAfterInteraction: false, /// optional
                  onChangeItemInViewPort: (index) {
                    print('item index: $index');
                  },
                  onInteraction: () {
                    print('on interaction callback');
                  },
                  onStarted: () {
                    print('on started callback');
                  },
                  onStopped: () {
                    print('on stopped callback');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      topHeadline,
                    ),
                  ),
                ),
              );
            }
          },
        ),
        centerTitle: true,
      ),
    );
  }
}
