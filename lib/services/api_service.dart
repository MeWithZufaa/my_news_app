import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:my_news_app/constants/my_url.dart';
import 'package:my_news_app/model/all_news_model.dart';
import 'package:my_news_app/model/top_news_model.dart';
class ApiService{

  Future<List<TopNewsModel>>  getTopNews()async{


    final url='${MyUrl.topNews}&apiKey=${MyUrl.apiKey}';
    final response= await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final jsonList=jsonDecode(response.body)['articles']as List;
      var jsonData=jsonList.map((json) => TopNewsModel.fromJson(json)).toList();

      return jsonData;
    }else{
      throw Exception("Failed to load data");
    }
  }

  Future<List<AllNewsModel>> getAllNews()async{

    final url="${MyUrl.allNews}&apiKey=${MyUrl.apiKey}";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final jsonList=jsonDecode(response.body)['articles'] as List;
      final jsonData=jsonList.map((json) =>AllNewsModel.fromJson(json)).toList();

      return jsonData;
    }else{
      throw Exception("Failed to load data");
    }

  }



}