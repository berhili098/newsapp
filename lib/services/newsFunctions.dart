import 'package:dio/dio.dart';

import '../models/news.dart';

class NewsFunctions {
  Dio dio = Dio();
  Future<Response> getNews() async {
    final response = await dio
        .get(
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=48f7511b53064bc7b260d58ef0f8ef7a',

            options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
            ))
        .catchError((e) {
      print(e);
    });
  print(response.data.length);
    return response;
  }

  Future<Response> getSearchNews(String search) async {
    final response = await dio
        .get(
            'https://newsapi.org/v2/everything?q=$search&apiKey=48f7511b53064bc7b260d58ef0f8ef7a',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
            ))
        .catchError((e) {
      print(e);
    });
    return response;
  }
}
