import 'package:coinbase/core/utils/values/colors.dart';
import 'package:coinbase/core/utils/values/styles.dart';
import 'package:coinbase/data/model/dto/coin_dto.dart';
import 'package:coinbase/modules/coin/controllers/coin_controller.dart';
import 'package:coinbase/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              ? const SizedBox().marginZero
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
