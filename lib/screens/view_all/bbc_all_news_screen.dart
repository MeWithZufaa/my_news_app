import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/bbc_news_controller.dart';
import 'package:my_news_app/widgets/build_image.dart';
import 'package:my_news_app/widgets/date_time_helper.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class BBCAllNewsScreen extends StatelessWidget {
  BBCAllNewsScreen({Key? key}) : super(key: key);

  final _bbcController = Get.put(BBCNewsController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "BBC News",
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
        if (_bbcController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: _bbcController.bbcNewsList.length,
              itemBuilder: (context, index) {
                final data = _bbcController.bbcNewsList[index];
                final timeAgo = DateTimeHelper.formatDateTime(
                    _bbcController.bbcNewsList[index]["publishedAt"]);
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
                          child: BuildImage(
                            size: size,
                            imgUrl: data['urlToImage'].toString(),
                          ),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ReusableText(text: data['title'].toString(),maxLines: 2,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ReusableText(text: timeAgo.toString()),
                            ),

                          ],
                        ))
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
