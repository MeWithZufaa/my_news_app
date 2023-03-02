
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
    return Obx(()=>Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
         // reverse: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _allNewsController.newsList.length,
          itemBuilder: (context,index){

            final newsList=_allNewsController.newsList[index];
           if(_allNewsController.isLoading.value || _allNewsController.hasError.value){
             return const Text("Loading.....");
           }else if(_allNewsController.newsList.isEmpty){
             return const Center(child:CircularProgressIndicator(),);
           }else{
             return Column(
               children: [

                BuildImage(size: MediaQuery.of(context).size, imgUrl: newsList.urlToImage)


               ],
             );
           }


          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
               childAspectRatio: 3/4,
              mainAxisSpacing: 5,
             crossAxisSpacing: 5,

      ),


      ),
    ),);
  }
}
