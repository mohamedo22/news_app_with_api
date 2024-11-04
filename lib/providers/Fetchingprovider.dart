import 'package:flutter/cupertino.dart';
import 'package:news_app_with_api/models/newsModel.dart';
import 'package:news_app_with_api/services/newsService.dart';

class ApiProvider with ChangeNotifier{
  newsModel? model;
  Future<void> fetching() async{
    model = null;
    model = await newsService.fetchingApi();
    notifyListeners();
  }
}