import 'package:flutter/material.dart';
import 'package:my_news_app/widgets/build_image.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String dateTime;
  const CustomCard({Key? key, required this.imageUrl, required this.title, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
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
              child: BuildImage(size: size,imgUrl: imageUrl.toString(),),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableText(text: title.toString(),maxLines: 2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableText(text: dateTime.toString()),
                ),

              ],))
          ],
        ),
      ),
    );
  }
}
