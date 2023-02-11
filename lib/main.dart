import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    GetMaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
