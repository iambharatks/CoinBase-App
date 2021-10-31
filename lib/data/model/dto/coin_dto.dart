import 'package:coinbase/data/model/response_DTOs/home_page/coin_response.dart';

class CoinDTO {
  String? lastUpdated;
  double? price;
  double? marketCap;
  double? percentChange24H;

  CoinDTO(
      {this.lastUpdated, this.marketCap, this.percentChange24H, this.price});

  static CoinDTO fromClass(CoinResponse response) => CoinDTO(
      percentChange24H: response.percentChange24H,
      price: response.price,
      marketCap: response.marketCap,
      lastUpdated: response.lastUpdated);
}
