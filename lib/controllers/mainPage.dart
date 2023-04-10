import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/services/newsFunctions.dart';

class MainPageController extends GetxController {
  NewsFunctions newsFunctions = NewsFunctions();
  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  List<News> allNews = [];

  getNewsData() async {
    isLoading.toggle();
    update();
    NewsFunctions newsFunctions = NewsFunctions();
     newsFunctions.getNews().then((value) {
      print(value.data['totalResults']);
      print(value.data);
      for (var i = 0; i < 20; i++) {
        allNews.add(News.fromJson(value.data['articles'][i]));
      }
      isLoading.toggle();
      update();
    });
  }

  searchNews()  { 
   
    if(searchController.text.isEmpty){
      getNewsData(); 
    }else{
         isLoading.toggle();
    update();
       NewsFunctions newsFunctions = NewsFunctions();
    newsFunctions.getSearchNews(searchController.text).then((value) {
      allNews.clear();
      print(value.data['totalResults']);
      print(value.data);
      for (var i = 0; i < 20; i++) {
        allNews.add(News.fromJson(value.data['articles'][i]));
      }
      isLoading.toggle();
      update();
    });
    }
 
   

  }

  @override
  void onInit() {
    getNewsData();
    super.onInit();
  }
}
