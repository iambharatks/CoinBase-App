import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
      fontFamily: 'sofia-pro',
      scaffoldBackgroundColor: Colors.white,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }));
}
