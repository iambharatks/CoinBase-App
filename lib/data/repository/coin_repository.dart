import 'dart:convert';

import 'package:coinbase/core/utils/values/constants.dart';
import 'package:coinbase/data/model/dto/coin_dto.dart';
import 'package:coinbase/data/model/response_DTOs/home_page/coin_response.dart';
import 'package:http/http.dart' as http;

class CoinRepository {
  Future<CoinDTO> getCoinData(String? symbol) async {
    final Uri uri = Uri.parse(URLs.coinInfo + symbol);
    http.Response response = await http.get(uri, headers: {
      'X-CMC_PRO_API_KEY': 'b5944f56-c30e-45d4-9dff-f636b751f2e3',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      final coinResponse = CoinResponse.fromJson(
          jsonDecode(data)['data'][symbol]['quote']['USD']);
      final coinData = CoinDTO.fromClass(coinResponse);
      return coinData;
    } else {
      print(response.statusCode);
      return CoinDTO();
    }
  }
}
