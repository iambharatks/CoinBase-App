import 'dart:developer';
import 'package:coinbase/core/utils/values/colors.dart';
import 'package:coinbase/core/utils/values/constants.dart';
import 'package:coinbase/core/utils/values/styles.dart';
import 'package:coinbase/modules/home_page/controllers/home_controller.dart';
import 'package:coinbase/routes/app_pages.dart';
import 'package:coinbase/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
        onRefresh: () => controller.onRefresh(),
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
                : BuildShimmer())),
      ),
    );
  }
}

class BuildShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => ShimmerCard()));
}

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 100,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 50,
            width: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryBlue),
          ),
        ],
      ),
    );
  }
}
