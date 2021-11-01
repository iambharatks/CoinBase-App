import 'package:flutter/cupertino.dart';

class CoinsResponse {
  late List<Coins> coins;

  CoinsResponse.fromJson(List<dynamic>? json) {
    if (json != null) {
      coins = [];
      for (var element in json) {
        coins.add(Coins.fromJson(element));
      }
    }
  }

  List<dynamic>? toJson() {
    List<dynamic>? data = <dynamic>[];
    if (coins != null) {
      data = coins.toList();
    }
    return data;
  }
}

class Coins {
  late final int? id;
  late final String? name;
  late final String? symbol;
  Coins(
    this.id,
    this.name,
    this.symbol,
  );

  Coins.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = <String, dynamic>{};
    data!['id'] = id;
    data!['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}
