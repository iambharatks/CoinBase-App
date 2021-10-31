import 'dart:developer';
import 'package:coinbase/core/utils/values/colors.dart';
import 'package:coinbase/core/utils/values/constants.dart';
import 'package:coinbase/core/utils/values/styles.dart';
import 'package:coinbase/modules/home_page/controllers/home_controller.dart';
import 'package:coinbase/routes/app_pages.dart';
import 'package:coinbase/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  static launch() => Get.toNamed(Routes.HOME_PAGE);

  @override
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    log("Home View");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        backgroundColor: AppColors.primaryBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: Strings.title,
            style: Styles.tsWhiteSemiBold22,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getCoinsList();
        },
        child: Obx(() => SingleChildScrollView(
            child: (controller.coinsList.value.isNotEmpty)
                ? ListView.separated(
                    itemBuilder: (_, index) =>
                        CryptoCard(info: controller.coinsList.value[index]),
                    itemCount: controller.coinsList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                  )
                : const SizedBox().marginZero)),
      ),
    );
  }
}
