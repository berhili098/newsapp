import 'package:dio/dio.dart';

import '../models/news.dart';
import '../utils/vars.dart';

class NewsFunctions {
  Dio dio = Dio();
  Future<Response> getNews() async {
    final response =
        await dio.get('$baseUrl/top-headlines?country=us&apiKey=$apiKey',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
            )); 
    return response;
  }

  Future<Response> getSearchNews(String search) async {
    final response =
        await dio.get('$baseUrl/everything?q=$search&apiKey=$apiKey',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
            ));

    return response;
  }
  
}
