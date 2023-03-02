class AllNewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final Source source;

  AllNewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });


  factory AllNewsModel.fromJson(Map<String,dynamic> json){
    return AllNewsModel(
        author: json['author']??'',
        title: json['title']??'',
        description: json['description']??'',
        url: json['url']??'',
        urlToImage: json['urlToImage']??'',
        publishedAt: json['publishedAt']??'',
        content:json['content']??'',
      source: Source.fromJson(json['source']??"")
    );
  }


}
class Source{

  final String name;

  Source( {required this.name});

  factory Source.fromJson(Map<String,dynamic> json){
    return Source(
        name: json['name']??""
    );
  }
}