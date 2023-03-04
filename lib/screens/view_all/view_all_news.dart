import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/all_news_controller.dart';
import 'package:my_news_app/widgets/build_image.dart';
import 'package:my_news_app/widgets/date_time_helper.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class ViewAllNews extends StatelessWidget {
   ViewAllNews({Key? key}) : super(key: key);

  final _allController=Get.put(AllNewsController());

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(text: "Global News",),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Obx((){
        if(_allController.isLoading.value || _allController.hasError.value){
          return const Center(child: CircularProgressIndicator(),);
        }else{
          return ListView.builder(
              itemCount: _allController.newsList.length,
              itemBuilder: (context,index){
                final data = _allController.newsList[index];
                final timeAgo = DateTimeHelper.formatDateTime(
                    data.publishedAt);

                return Card(
                  elevation: 4,
                  child: Container(
                    height: 100,
                    width: size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: BuildImage(size: size,imgUrl: data.urlToImage.toString(),),
                        ),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ReusableText(text: data.title.toString(),maxLines: 2,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ReusableText(text:timeAgo.toString(),maxLines: 2,),
                          ),

                        ],))
                      ],
                    ),
                  ),
                );
              }
          );
        }
      }),
    );
  }
}
