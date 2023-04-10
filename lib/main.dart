import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newsapp/utils/vars.dart';
import 'package:newsapp/views/mainPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {runApp(
    ConnectivityAppWrapper(
      app: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: primaryColor,
                  ),
              primaryColor: primaryColor,
            ),
            home: MainPage(),
          );
        },
      ),
    ),
  );
});
  }
