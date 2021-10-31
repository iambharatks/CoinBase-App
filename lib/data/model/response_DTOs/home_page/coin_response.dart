class CoinResponse {
  double? price;
  double? percentChange24H;
  double? marketCap;
  String? lastUpdated;

  CoinResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      price = json['price'];
      percentChange24H = json['percent_change_24h'];
      marketCap = json['market_cap'];
      lastUpdated = json['last_updated'];
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['percent_change_24h'] = percentChange24H;
    data['market_cap'] = marketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
