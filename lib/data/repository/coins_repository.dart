import 'dart:convert';

import 'package:coinbase/core/utils/values/constants.dart';
import 'package:coinbase/data/model/dto/coins_dto.dart';
import 'package:coinbase/data/model/response_DTOs/home_page/coins_response.dart';
import 'package:http/http.dart' as http;

class CoinsRepository {
  Future<List<CoinsDTO>> getCoinsList() async {
    final Uri uri = Uri.parse(
        URLs.coinsInfo);
    http.Response response = await http.get(uri, headers: {
      'X-CMC_PRO_API_KEY': 'b5944f56-c30e-45d4-9dff-f636b751f2e3',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      final coinsListResponse =
          CoinsResponse.fromJson(jsonDecode(data)['data']);
      final coinsList = <CoinsDTO>[];
      for (var classResponse in coinsListResponse.coins) {
        coinsList.add(CoinsDTO.fromClass(classResponse));
      }
      return coinsList;
    } else {
      print(response.statusCode);
      return [];
    }
  }
}
