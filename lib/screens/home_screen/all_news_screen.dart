
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/all_news_controller.dart';
import 'package:my_news_app/screens/view_all/view_all_news.dart';
import 'package:my_news_app/widgets/build_image.dart';
import 'package:my_news_app/widgets/custom_card.dart';
import 'package:my_news_app/widgets/date_time_helper.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class AllNewsScreen extends StatelessWidget {
  AllNewsScreen({Key? key}) : super(key: key);
  final _allNewsController=Get.put(AllNewsController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(text: "All News"),
              InkWell(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllNews()));
                  },
                  child: ReusableText(text: "View All",size: 15,))

            ],
          ),
        ),
        Obx((){
          if(_allNewsController.isLoading.value || _allNewsController.hasError.value){

            return const Center(child: CircularProgressIndicator(),);
          }else{

            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _allNewsController.newsList.length,
                itemBuilder: (context,index){
                  final data=_allNewsController.newsList[index];
                  final timeAgo=DateTimeHelper.formatDateTime(data.publishedAt);
                  return CustomCard(imageUrl: data.urlToImage.toString(), title: data.title.toString(), dateTime: timeAgo.toString());

                }
            );
          }

        },),
      ],
    );
  }
}
