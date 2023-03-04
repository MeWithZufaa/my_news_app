import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/controllers/bbc_news_controller.dart';
import 'package:my_news_app/screens/view_all/bbc_all_news_screen.dart';
import 'package:my_news_app/widgets/build_image.dart';
import 'package:my_news_app/widgets/date_time_helper.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class BBCNewsScreen extends StatelessWidget {
  BBCNewsScreen({Key? key}) : super(key: key);

  final _bbcNewsController = Get.put(BBCNewsController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(text: "BBC News"),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBCAllNewsScreen()));
                  },
                  child: ReusableText(
                    text: "View All",
                    size: 15,
                  ))
            ],
          ),
        ),
        Obx(() {
          if (_bbcNewsController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _bbcNewsController.bbcNewsList.length,
                itemBuilder: (context, index) {
                  final data = _bbcNewsController.bbcNewsList[index];
                  final timeAgo = DateTimeHelper.formatDateTime(
                      _bbcNewsController.bbcNewsList[index]["publishedAt"]);
                  return Card(
                    elevation: 4,
                    child: Container(
                      height: 100,
                      width: size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                                child: BuildImage(
                              size: size,
                              imgUrl: data['urlToImage'].toString(),
                            )),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _bbcNewsController.bbcNewsList[index]
                                      ['title'],
                                  maxLines: 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(timeAgo),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                });
          }
        }),
      ],
    );
  }
}
