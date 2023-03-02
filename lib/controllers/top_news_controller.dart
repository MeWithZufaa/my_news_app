

import 'package:get/get.dart';
import 'package:my_news_app/model/top_news_model.dart';
import 'package:my_news_app/services/api_service.dart';

class TopNewsController extends GetxController {
  final _apiService = ApiService();
  var isLoading=true.obs;
  var hasError=true.obs;
  RxList<TopNewsModel> topNewsList = <TopNewsModel>[].obs;


  @override
  void onInit(){
    super.onInit();
    fetchTopNews();
  }

  Future<void> fetchTopNews() async {
    try{
      final response = await _apiService.getTopNews();
      topNewsList.value=response;
      isLoading.value=false;
      hasError.value=false;
      print(topNewsList.value);
    }catch(e){
      print("Error : $e");
      isLoading.value=false;
      hasError.value=false;
    }

  }
}
