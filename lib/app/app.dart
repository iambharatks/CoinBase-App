import 'dart:developer';

import 'package:coinbase/core/utils/theme/app_theme.dart';
import 'package:coinbase/core/utils/values/constants.dart';
import 'package:coinbase/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_binding.dart';
import 'app_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("In App");
    return GetMaterialApp(
      title: Strings.title,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      home: AppView(),
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
    );
  }
}
