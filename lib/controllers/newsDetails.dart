import 'dart:ui';

import 'package:get/get_core/get_core.dart';
import 'package:intl/intl.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:newsapp/models/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsController extends GetxController {
  News news = Get.arguments;
  var cont;
  convertDate(givenDate) {
    String formattedDate = DateFormat('yyyy-MM-dd ')
        .format(DateTime.parse('2023-04-09T20:47:05Z'));
    print(formattedDate);
    return formattedDate;
  }

  launchURL(url) {
    cont = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    update();
  }
}
