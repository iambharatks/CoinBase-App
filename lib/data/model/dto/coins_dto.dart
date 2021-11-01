import 'package:coinbase/data/model/response_DTOs/home_page/coins_response.dart';
import 'package:flutter/cupertino.dart';

class CoinsDTO {
  late final String? name;
  late final String? symbol;
  late final int? id;
  final NetworkImage? image;

  CoinsDTO({
    this.image,
    this.id,
    this.name,
    this.symbol,
  });

  static CoinsDTO fromClass(Coins classResponse) => CoinsDTO(
        name: classResponse.name,
        symbol: classResponse.symbol,
        id: classResponse.id,
        image:
            NetworkImage(
                "https://s2.coinmarketcap.com/static/img/coins/64x64/${classResponse.id}.png"),
      );
}
