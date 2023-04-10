import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:newsapp/controllers/newsDetails.dart';

import '../utils/connectivityWrapper.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return connectivityWrapper(Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("News App"),
        ),
        body: GetBuilder<NewsDetailsController>(
            init: NewsDetailsController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 200.h,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: controller.news.urlToImage!,
                          placeholder: (context, url) => Center(
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          15.verticalSpace,
                          Text(
                            controller.news.title!,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          20.verticalSpace,
                          Text(
                            controller.news.description!,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            })));
  }
}
