import 'package:famhub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app_internalisation.dart';
import 'member_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
// You can use the library anywhere in the app even in theme
      home: const MemberProfile(),
      locale: Get.deviceLocale,
      translations: AppTranslations(),
      routes: PageRoutes().routes(),
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontFamily: 'Roboto'
              )
          )
      ),
    );
  }
}

