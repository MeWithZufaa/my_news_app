import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_news_app/constants/my_url.dart';
import 'package:http/http.dart'as http;
class BBCNewsController extends GetxController{

  var isLoading = true.obs;
  var bbcNewsList=[].obs;

  @override
  void onInit() {
    fetchGeneralNews();
    super.onInit();
  }

  Future<void> fetchGeneralNews()async{

    try{
      isLoading(true);
      final url="${MyUrl.bbcnews}&${MyUrl.apiKey}";

      final response= await http.get(Uri.parse(url));
      print(response);
      if(response.statusCode==200){

        final Map<String,dynamic> jsonData=jsonDecode(response.body);
        bbcNewsList.value=jsonData['articles'];


      }else{
        throw Exception('Failed to load data');
      }
    }finally{
     isLoading(false);
    }


  }

}