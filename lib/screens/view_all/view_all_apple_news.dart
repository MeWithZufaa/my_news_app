import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/apple_controller.dart';
import 'package:my_news_app/screens/details/news_details_screen.dart';
import 'package:my_news_app/widgets/custom_card.dart';
import 'package:my_news_app/widgets/date_time_helper.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class ViewAllAppleNews extends StatelessWidget {
  ViewAllAppleNews({Key? key}) : super(key: key);

  final _appleController = Get.put(AppleController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Apple",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Obx(() {
        if (_appleController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: _appleController.appleNews.length,
              itemBuilder: (context, index) {
                final data = _appleController.appleNews[index];
                final timeAgo = DateTimeHelper.formatDateTime(
                    data["publishedAt"]);
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
              });
        }
      }),
    );
  }
}
