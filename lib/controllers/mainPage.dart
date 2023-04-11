import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
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
    allNews.clear();
    try {
      newsFunctions.getNews().then((value) {
        for (var i = 0; i < 20; i++) {
          allNews.add(News.fromJson(value.data['articles'][i]));
        }
        isLoading.toggle();
        update();
      });
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  searchNews() {
    if (searchController.text.isEmpty) {
      getNewsData();
    } else {
    try {
        isLoading.toggle();
      update();
      NewsFunctions newsFunctions = NewsFunctions();
      newsFunctions.getSearchNews(searchController.text).then((value) {
        allNews.clear();
        for (var i = 0; i < 20; i++) {
          allNews.add(News.fromJson(value.data['articles'][i]));
        }
        isLoading.toggle();
        update();
      });
    } catch (e) {
      Get.snackbar('error', e.toString());
      
    }
    }
  }

  convertDate(givenDate){
    String formattedDate = DateFormat('yyyy-MM-dd ').format(DateTime.parse('2023-04-09T20:47:05Z'));
print(formattedDate);
return formattedDate;
    

  }

  @override
  void onInit() {
    getNewsData();
    super.onInit();
  }
}
