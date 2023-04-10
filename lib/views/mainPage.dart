import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/mainPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Hello World ${controller.count} '),
                  15.verticalSpace,
                  ElevatedButton(
                    onPressed: () {
                      controller.increment();
                    },
                    child: Text('Increment'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
