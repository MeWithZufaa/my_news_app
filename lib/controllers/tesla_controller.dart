import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_news_app/constants/my_url.dart';
import 'package:http/http.dart'as http;
class TeslaController extends GetxController{

  var isLoading=true.obs;
  var teslaNews=[].obs;


  @override
  void onInit() {
    fetchTeslaNews();
    super.onInit();
  }

  Future<void> fetchTeslaNews()async{


    try{
     isLoading(true);
      final url='${MyUrl.teslaApi}&${MyUrl.apiKey}';
      final response = await http.get(Uri.parse(url));

      if(response.statusCode==200){
        final Map<String,dynamic> json=jsonDecode(response.body);
        teslaNews.value=json['articles']as List;
      }else{
        throw Exception('Failed to load data');
      }


    }finally{

      isLoading(false);
    }


  }

}