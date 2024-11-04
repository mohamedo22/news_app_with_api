import 'package:dio/dio.dart';
import 'package:news_app_with_api/models/newsModel.dart';

class newsService{
  static Future<newsModel> fetchingApi() async{
    Dio dio = Dio();
    try {
      var response = await dio.get(
          "https://newsapi.org/v2/everything?q=tesla&from=2024-10-04&sortBy=publishedAt&apiKey=6560270b4cd043d09f9e200f82e64afe");
      if(response.statusCode == 200)
      {
       return newsModel.getData(response.data);
      }
      else{
        throw new Future.error("code is ${response.statusCode}");
      }
    }
    catch(e){
      throw new Future.error("an error accrue during api fetching $e");
    }
  }
}