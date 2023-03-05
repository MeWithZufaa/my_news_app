import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_news_app/constants/my_url.dart';
import 'package:http/http.dart'as http;
class ScienceController extends GetxController{

  var isLoading=true.obs;
  var scienceNews=[].obs;

  @override
  void onInit() {
    fetchScienceNews();
    super.onInit();
  }

  Future<void> fetchScienceNews()async{

    try{
      isLoading(true);
      final url="${MyUrl.scienceApi}&${MyUrl.apiKey}";

      final response=await http.get(Uri.parse(url));

      if(response.statusCode==200){
        final Map<String,dynamic> json=jsonDecode(response.body);
        scienceNews.value=json['articles']as List;
      }else{
        throw Exception('Failed to load data');
      }
    }finally{
      isLoading(false);
    }



  }

}