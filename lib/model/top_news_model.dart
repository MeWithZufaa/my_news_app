class TopNewsModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedDate;
  String content;

  TopNewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedDate,
    required this.content,
  });

  factory TopNewsModel.fromJson(Map<String,dynamic> json){
    return TopNewsModel(
        author: json['author']??'',
        title: json['title']??'',
        description: json['description']??'',
        url: json['url']??'',
        urlToImage: json['urlToImage']??'',
        publishedDate: json['publishedAt']??'',
        content: json['content']??'',
    );
  }
}
