import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainPageController extends GetxController {
  final count = 0.obs;
  int count2 = 0;
  void increment() {
    count.value++;
    update();
  }
}
