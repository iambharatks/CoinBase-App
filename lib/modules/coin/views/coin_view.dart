import 'package:coinbase/core/utils/values/colors.dart';
import 'package:coinbase/core/utils/values/styles.dart';
import 'package:coinbase/data/model/dto/coin_dto.dart';
import 'package:coinbase/modules/coin/controllers/coin_controller.dart';
import 'package:coinbase/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CoinView extends GetView<CoinController> {
  static launch() => Get.toNamed(Routes.COIN_VIEW);
  final String? coinName;
  final String? coinSymbol;

  CoinView({this.coinName, this.coinSymbol});

  CoinDTO? getData() {
    return controller.coinData.value!;
  }

  @override
  Widget build(BuildContext context) {
    final CoinController controller =
        Get.put(CoinController(symbol: coinSymbol));
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
          text: TextSpan(
            text: coinName,
            style: Styles.tsWhiteSemiBold22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => (getData()!.marketCap == 0)
              ? BuildShimmer()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.getCoinData();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          "MarketCap :${controller.coinData.value!.marketCap}",
                          style: Styles.tsPrimaryBlueMedium14,
                        ),
                        Text(
                          "Price (In USD) : + ${controller.coinData.value!.price}",
                          style: Styles.tsPrimaryBlueMedium14,
                        ),
                        Text(
                          "Percent change 24H : ${controller.coinData.value!.percentChange24H}",
                          style: Styles.tsPrimaryBlueMedium14,
                        ),
                        Text(
                          "Last Updated :" +
                              controller.coinData.value!.lastUpdated!,
                          style: Styles.tsPrimaryBlueMedium14,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class BuildShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: const [
              Text(
                "MarketCap :",
                style: Styles.tsPrimaryBlueMedium14,
              ),
              Text(
                "Price (In USD) : + ",
                style: Styles.tsPrimaryBlueMedium14,
              ),
              Text(
                "Percent change 24H : ",
                style: Styles.tsPrimaryBlueMedium14,
              ),
              Text(
                "Last Updated :",
                style: Styles.tsPrimaryBlueMedium14,
              ),
            ],
          )),
    );
  }
}
