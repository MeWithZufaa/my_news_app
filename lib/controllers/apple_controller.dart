import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_news_app/constants/my_url.dart';
import 'package:http/http.dart'as http;
class AppleController extends GetxController{

  var isLoading=true.obs;
  var appleNews=[].obs;

  @override
  void onInit() {
    fetchAppleNews();
    super.onInit();
  }

  Future<void> fetchAppleNews()async{

    try{
      isLoading(true);
      final url="${MyUrl.appleNews}&${MyUrl.apiKey}";

      final response=await http.get(Uri.parse(url));

      if(response.statusCode==200){
        final Map<String,dynamic> json=jsonDecode(response.body);
        appleNews.value=json['articles']as List;
      }else{
        throw Exception('Failed to load data');
      }
    }finally{
      isLoading(false);
    }



  }

}