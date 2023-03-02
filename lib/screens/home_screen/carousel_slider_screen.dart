import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/all_news_controller.dart';
import 'package:my_news_app/widgets/build_image.dart';

class CarouselSliderScreen extends StatelessWidget {
   CarouselSliderScreen({Key? key}) : super(key: key);

  final _newsController=Get.put(AllNewsController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Obx((){

      if(_newsController.newsList.isEmpty){
        return Center(child: CircularProgressIndicator(),);
      }else {

        return CarouselSlider.builder(
            itemCount: _newsController.newsList.length,
            itemBuilder: (context,index,sliderIndex){
              final data=_newsController.newsList[index];
              return BuildImage(size: size, imgUrl: data.urlToImage);

            },
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              initialPage: 0,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,)
        );
      }
    } );


  }
}
