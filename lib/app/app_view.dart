import 'dart:developer';
import 'package:coinbase/modules/coin/views/coin_view.dart';
import 'package:coinbase/modules/home_page/views/home_view.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("In AppView");
    return HomeView();
  }
}
