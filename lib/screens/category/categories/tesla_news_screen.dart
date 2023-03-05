import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/tesla_controller.dart';
import 'package:my_news_app/screens/details/news_details_screen.dart';
import 'package:my_news_app/screens/view_all/view_all_tesla_news.dart';
import 'package:my_news_app/widgets/custom_card.dart';
import 'package:my_news_app/widgets/date_time_helper.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class TeslaNewsScreen extends StatelessWidget {
  TeslaNewsScreen({Key? key}) : super(key: key);
  final _teslaController=Get.put(TeslaController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(text: "Tesla"),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllTeslaNews()));
                  },
                  child: ReusableText(
                    text: "View All",
                    size: 15,
                  ))
            ],
          ),
        ),

        Obx((){

          if(_teslaController.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _teslaController.teslaNews.length,
                itemBuilder: (context,index){
                  final data=_teslaController.teslaNews[index];
                  final timeAgo = DateTimeHelper.formatDateTime( data["publishedAt"]);

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
                      child: CustomCard(imageUrl: data['urlToImage'].toString(),title: data['title'].toString(),dateTime: timeAgo.toString(),));
                }

            );
          }

        }),
      ],
    );


  }
}
