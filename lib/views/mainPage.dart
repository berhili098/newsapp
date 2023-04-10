import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/mainPage.dart';

import '../utils/connectivityWrapper.dart';
import '../utils/widgets.dart';
import 'newsDetails.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (controller) {
          return connectivityWrapper(
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text("News App"),
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        10.verticalSpace,
                        MyTextField(
                          hintText:
                              'Rechercher des actualités liées à un sujet',
                          controller: controller.searchController,
                          onChange: () {
                            controller.searchNews();
                          },
                        ),
                        10.verticalSpace,
                        controller.isLoading.value
                            ? Center(
                                child: Image.asset(
                                  'assets/img/loading.gif',
                                ),
                              )
                            : SizedBox(
                                height: 650.h,
                                child: controller.allNews.isEmpty
                                    ? Image.asset("assets/img/nodata.png")
                                    : GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 0.7,
                                        ),
                                        itemCount: controller.allNews.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Get.to( () => NewsDetailsScreen(
                                                    
                                                  ),
                                                  arguments: controller
                                                        .allNews[index]
                                                  );

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 100.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl: controller
                                                              .allNews[index]
                                                              .urlToImage ??
                                                          "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",
                                                      fit: BoxFit.cover,
                                                      placeholder:
                                                          (context, url) =>
                                                              Center(
                                                        child: Container(
                                                          width: 30.w,
                                                          height: 30.h,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      errorWidget:
                                                          (context, url, error) =>
                                                              Icon(Icons.error),
                                                    ),
                                                  ),
                                                  10.verticalSpace,
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10.w),
                                                    child: Text(
                                                      "title:" +
                                                              controller
                                                                  .allNews[index]
                                                                  .title! ??
                                                          "Pas de titre",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: false,
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  10.verticalSpace,
                                                  Flexible(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w),
                                                      child: Text(
                                                        controller.allNews[index]
                                                                .description ??
                                                            "Pas de description",
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        softWrap: false,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
