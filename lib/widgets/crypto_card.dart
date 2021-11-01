import 'dart:developer';

import 'package:coinbase/core/utils/values/styles.dart';
import 'package:coinbase/data/model/dto/coins_dto.dart';
import 'package:coinbase/modules/coin/views/coin_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const String image = "https://s2.coinmarketcap.com/static/img/coins/64x64/";

class CryptoCard extends StatelessWidget {
  CoinsDTO info;

  CryptoCard({required this.info});

  getImage() {
    return info.image;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GestureDetector(
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: getImage(),
                ),
              ),
            ),
            Text(
              " ${info.name} - ${info.symbol}",
              style: Styles.tsPrimaryTextBold20,
            )
          ],
        ),
        onTap: () {
          Get.to(CoinView(
            coinSymbol: info.symbol,
            coinName: info.name,
          ));
        },
      ),
    );
  }
}
