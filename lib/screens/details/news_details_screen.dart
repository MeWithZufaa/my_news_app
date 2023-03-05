import 'package:flutter/material.dart';
import 'package:my_news_app/widgets/reusable_text.dart';

class NewsDetailsScren extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String dateTime;
  final String description;
  final String content;
  const NewsDetailsScren({Key? key, required this.imageUrl, required this.title, required this.author, required this.dateTime, required this.description, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    image:  DecorationImage(
                      image: NetworkImage(
                        imageUrl.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,

                  child: IconButton(onPressed: (){}, icon:const Icon(Icons.favorite_border,size:30,color: Colors.red,),),)
            ],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableText(text: title.toString()),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableText(text: author.toString()),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableText(text: dateTime.toString(),color: Colors.deepOrangeAccent,),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableText(text: description.toString()),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableText(text:content.toString()),
          ),

        ],
      ),
    ));
  }
}
