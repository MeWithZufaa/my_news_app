import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/all_news_controller.dart';
import 'package:my_news_app/screens/details/news_details_screen.dart';
import 'package:my_news_app/widgets/build_image.dart';
import 'package:my_news_app/widgets/custom_card.dart';
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

                return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScren(
                            imageUrl: data.urlToImage,
                            title: data.title,
                            author: data.title,
                            dateTime: timeAgo,
                            description: data.description,
                            content: data.content,
                          ),
                        ),
                      );
                    },

                    child: CustomCard(imageUrl: data.urlToImage.toString(), title: data.title.toString(), dateTime: timeAgo.toString()));
              }
          );
        }
      }),
    );
  }
}
