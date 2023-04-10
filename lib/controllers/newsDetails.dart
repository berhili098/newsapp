import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:newsapp/models/news.dart';

class NewsDetailsController extends GetxController{
  News news = Get.arguments;

}