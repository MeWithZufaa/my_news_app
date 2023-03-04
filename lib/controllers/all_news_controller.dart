import 'package:get/get.dart';
import 'package:my_news_app/model/all_news_model.dart';
import 'package:my_news_app/services/api_service.dart';

class AllNewsController extends GetxController{
   final _apiService=ApiService();
   var isLoading=true.obs;
   var hasError=true.obs;
  RxList<AllNewsModel> newsList=<AllNewsModel>[].obs;


  @override
  void onInit() {
    fetchAllNews();
    super.onInit();
  }


  Future<void> fetchAllNews()async{
  try{
    final response=await  _apiService.getAllNews();
    newsList.value=response;
    isLoading.value=false;
    hasError.value=false;
  }catch(e){
    print("Error : $e");

    isLoading.value=false;
    hasError.value=false;

  }



  }

}