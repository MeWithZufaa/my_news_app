import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/general_news_controller.dart';
import 'package:my_news_app/screens/details/news_details_screen.dart';
import 'package:my_news_app/screens/view_all/general_all_news_screen.dart';
import 'package:my_news_app/widgets/custom_card.dart';
import 'package:my_news_app/widgets/date_time_helper.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class GeneralScreen extends StatelessWidget {
   GeneralScreen({Key? key}) : super(key: key);

  final _generalNewsController=Get.put(GeneralNewsController());

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(text: "General News"),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GeneralAllNewsScreen()));
                  },
                  child: ReusableText(text: "View All",size: 15,))

            ],
          ),
        ),

        Obx((){
          if(_generalNewsController.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }else{

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _generalNewsController.generalNewsList.length,
                itemBuilder: (context,index){
                  final timeAgo=DateTimeHelper.formatDateTime(_generalNewsController.generalNewsList[index]["publishedAt"]);
                  final data=_generalNewsController.generalNewsList[index];
                  return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsScren(
                              imageUrl: data['urlToImage'],
                              title: data['title'],
                              author: data['author'],
                              dateTime: timeAgo,
                              description: data['description'],
                              content: data['content'],
                            ),
                          ),
                        );
                      },
                      child: CustomCard(imageUrl: data['urlToImage'].toString(), title: data['title'].toString(), dateTime: timeAgo.toString()));
                }

            );
          }

        }),
      ],
    );
  }
}
