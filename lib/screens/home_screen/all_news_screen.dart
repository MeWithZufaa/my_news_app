
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/all_news_controller.dart';
import 'package:my_news_app/widgets/build_image.dart';

class AllNewsScreen extends StatelessWidget {
  AllNewsScreen({Key? key}) : super(key: key);
  final _allNewsController=Get.put(AllNewsController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        child:Obx(()=>GridView.builder(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              mainAxisExtent: 220),
          itemCount:_allNewsController.newsList.length,
          itemBuilder: (BuildContext context, int index) {
            final data=_allNewsController.newsList[index];
            // build each item in the grid here
            return BuildImage(
              size: MediaQuery.of(context).size,
              imgUrl: data.urlToImage,
            );
          },
        ),)


      ),
    );
  }
}
