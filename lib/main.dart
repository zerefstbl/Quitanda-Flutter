import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './src/pages/auth/controller/auth.controller.dart';
import './src/pages.routes/app.pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());

  runApp(
    GetMaterialApp(
      title: 'GreenGrocer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xfffffafa),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    ),
  );
}
